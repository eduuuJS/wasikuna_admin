// ignore_for_file: empty_catches

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/booking/data/repository/booking_repository.dart';
import 'package:wasikuna_admin/app/features/booking/domain/area_detail_domain.dart';
import 'package:wasikuna_admin/app/shared/domain/response_mutation_domain.dart';
import 'package:wasikuna_admin/core/utils/parser.dart';

part 'new_booking_controller.g.dart';

@riverpod
Future<bool> newBookingLoader(
    NewBookingLoaderRef ref, String idArea, DateTime dateBooking) async {
  await Future.delayed(Duration.zero);
  await ref.watch(areaDetailBookingProvider.notifier).getItem(idArea);
  ref.watch(newBookingControllerProvider.notifier).setDateBoocking(dateBooking);
  ref.watch(newBookingControllerProvider.notifier).setIdArea(idArea);
  return true;
}

@riverpod
class AreaDetailBooking extends _$AreaDetailBooking {
  @override
  AreaDetailDomain? build() {
    return null;
  }

  Future<void> getItem(String idArea) async {
    final repository = ref.watch(bookingRepositoryProvider);
    try {
      final response = await repository.getAreaDetail(idArea);
      state = response;
      ref.watch(newBookingControllerProvider.notifier).ctrlStartTime.text =
          response.openTime;
      ref.watch(newBookingControllerProvider.notifier).ctrlEndTime.text =
          response.closeTime;
    } catch (e) {}
  }
}

@riverpod
class ImageListState extends _$ImageListState {
  @override
  List<File> build() {
    return [];
  }

  bool addImage(File image) {
    if (state.length < 3) {
      state.add(image);
      state = state.toList();
      return true;
    } else {
      return false;
    }
  }

  void removeImage(File image) {
    state.remove(image);
    state = state.toList();
  }
}

@riverpod
class NewBookingController extends _$NewBookingController {
  TextEditingController ctrlStartTime = TextEditingController();
  TextEditingController ctrlEndTime = TextEditingController();

  late DateTime dateBoocking;
  late String idArea;
  final formKey = GlobalKey<FormState>();

  @override
  void build() {
    return;
  }

  void setDateBoocking(DateTime date) {
    dateBoocking = date;
  }

  void setIdArea(String id) {
    idArea = id;
  }

  String? validate() {
    final startTimeBook = Parser.stringToTimeOfDay(ctrlStartTime.text);
    final endTimeBook = Parser.stringToTimeOfDay(ctrlEndTime.text);
    final startTimeArea = Parser.stringToTimeOfDay(
        ref.watch(areaDetailBookingProvider)!.openTime);
    final endTimeArea = Parser.stringToTimeOfDay(
        ref.watch(areaDetailBookingProvider)!.closeTime);
    if (startTimeBook < startTimeArea) {
      return "La hora de inicio no puede ser menor a la hora de apertura del área";
    } else if (endTimeBook > endTimeArea) {
      return "La hora de fin no puede ser mayor a la hora de cierre del área";
    } else if (startTimeBook >= endTimeBook) {
      return "La hora de inicio no puede ser mayor a la hora de fin";
    } else if (ref.watch(imageListStateProvider).isEmpty) {
      return "Debe agregar al menos una imagen de su comprobante de pago";
    } else {
      return null;
    }
  }

  Future<ResponseMutationDomain> createBooking() async {
    final repository = ref.watch(bookingRepositoryProvider);
    return await repository.createBooking(
        idArea,
        "1",
        dateBoocking,
        ctrlStartTime.text,
        ctrlEndTime.text,
        ref.watch(imageListStateProvider));
  }
}
