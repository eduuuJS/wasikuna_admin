import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:wasikuna_admin/app/features/booking/data/dto/request_create_booking_dto.dart';
import 'package:wasikuna_admin/app/features/booking/data/dto/response_area_detail_dto.dart';
import 'package:wasikuna_admin/app/features/booking/data/dto/response_atachment_dto.dart';
import 'package:wasikuna_admin/app/features/booking/data/dto/response_booking_detail_dto.dart';
import 'package:wasikuna_admin/app/features/booking/domain/area_detail_domain.dart';
import 'package:wasikuna_admin/app/features/booking/domain/booking_detail_domain.dart';
import 'package:wasikuna_admin/app/shared/domain/response_mutation_domain.dart';
import 'package:wasikuna_admin/core/network/dio_client.dart';
import 'package:wasikuna_admin/core/utils/dependency_injection.dart';
import 'package:wasikuna_admin/core/utils/parser.dart';
part 'booking_repository.g.dart';

abstract class IBookingRepository {
  Future<AreaDetailDomain> getAreaDetail(String idArea);
  Future<ResponseMutationDomain<bool>> createBooking(
      String idArea,
      String idUser,
      DateTime dateBooking,
      String startTime,
      String endTime,
      List<File> imageFiles);
  Future<BookingDetailDomain> getBookingDetail(String idBooking);
  Future<ResponseMutationDomain<bool>> reviewBooking(
      String idBooking, String comment, bool isApproved);
}

class BookingRepository implements IBookingRepository {
  final _dioClient = sl<DioClient>();

  @override
  Future<AreaDetailDomain> getAreaDetail(String idArea) async {
    final response = await _dioClient.get(
      path: "/api/room/$idArea/detail",
    );
    return ResponseAreaDetailDto.fromJson(response.data).toDomain();
  }

  Future<List<String>> _postImportAttachement(List<File> imageFiles) async {
    try {
      List<MultipartFile> files = [];
      for (var img in imageFiles) {
        files.add(await MultipartFile.fromFile(
          img.path,
          filename: img.path.split('/').last,
          contentType: MediaType('image', img.path.split('.').last),
        ));
      }
      FormData formData = FormData.fromMap(
        {
          "files": files,
        },
      );
      final response = await _dioClient.post(
          path: '/api/attachments/reservation/payment',
          contentType: 'multipart/form-data',
          formData: formData);
      return ResponseAtachmentIdsDto.fromJson(response.data).ids!;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<ResponseMutationDomain<bool>> createBooking(
      String idArea,
      String idUser,
      DateTime dateBooking,
      String startTime,
      String endTime,
      List<File> imageFiles) async {
    try {
      final ids = await _postImportAttachement(imageFiles);
      if (ids.isEmpty) throw Exception("Error al subir las imágenes");
      final response = await _dioClient.post(
          path: "/api/reservation",
          bodyRaw: RequestCreateBookingDto(
                  roomId: int.parse(idArea),
                  date: Parser.dateToDDMMYYYY(dateBooking),
                  startTime: Parser.timeToStringFormat24(startTime),
                  endTime: Parser.timeToStringFormat24(endTime),
                  payment: ids.first)
              .toJson());
      final status = response.statusCode == 201;
      return ResponseMutationDomain(
        message: status ? "Reservación registrada" : response.data["message"],
        success: status,
        data: status ? true : false,
      );
    } catch (e) {
      return ResponseMutationDomain(
        message: e.toString(),
        success: false,
      );
    }
  }

  @override
  Future<BookingDetailDomain> getBookingDetail(String idBooking) async {
    final response = await _dioClient.get(
      path: "/api/reservation/$idBooking",
    );
    return ResponseBookingDetailDto.fromJson(response.data).toDomain();
  }

  @override
  Future<ResponseMutationDomain<bool>> reviewBooking(
      String idBooking, String comment, bool isApproved) async {
    try {
      final response = await _dioClient
          .put(path: "/api/reservation/approveOrObserve", bodyRaw: {
        "id": int.parse(idBooking),
        "status_reservation_id": isApproved ? 1 : 3,
      });
      final status = response.statusCode == 200;
      return ResponseMutationDomain(
        message: status ? "Reservación actualizada" : response.data["message"],
        success: status,
        data: status ? true : false,
      );
    } catch (e) {
      return ResponseMutationDomain(
        message: e.toString(),
        success: false,
      );
    }
  }
}

@riverpod
IBookingRepository bookingRepository(BookingRepositoryRef ref) {
  return BookingRepository();
}
