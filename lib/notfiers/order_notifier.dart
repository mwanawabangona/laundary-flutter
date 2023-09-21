import 'package:dry_cleaners/models/add_order_model/add_order_model.dart';
import 'package:dry_cleaners/models/all_orders_model/all_orders_model.dart';
import 'package:dry_cleaners/models/coupon_response_model/coupon_response_model.dart';
import 'package:dry_cleaners/models/order_details_model/order_details_model.dart';
import 'package:dry_cleaners/models/order_place_model/order_place_model.dart';
import 'package:dry_cleaners/models/schedules_model/schedules_model.dart';
import 'package:dry_cleaners/repos/order_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:dry_cleaners/services/network_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllOrdersNotifier extends StateNotifier<ApiState<AllOrdersModel>> {
  AllOrdersNotifier(this._repo, this._filter)
      : super(const ApiState.initial()) {
    getAllOrders();
  }
  final IOrderRepo _repo;
  final String _filter;
  Future<void> getAllOrders() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(data: await _repo.getAllOrders(_filter));
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class OrderDetailsNotifier extends StateNotifier<ApiState<OrderDetailsModel>> {
  OrderDetailsNotifier(this._repo, this._id) : super(const ApiState.initial()) {
    getOrderDetails();
  }
  final IOrderRepo _repo;
  final String _id;
  Future<void> getOrderDetails() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(data: await _repo.getOrderDetails(_id));
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class PlaceOrderNotifier extends StateNotifier<ApiState<AddOrderModel>> {
  PlaceOrderNotifier(
    this._repo,
  ) : super(const ApiState.initial());
  final IOrderRepo _repo;

  Future<void> addOrder(OrderPlaceModel orderPlaceModel) async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(data: await _repo.addOrder(orderPlaceModel));
    } catch (e) {
      debugPrint(e.toString());
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class UpdateOrderNotifier extends StateNotifier<ApiState<AddOrderModel>> {
  UpdateOrderNotifier(this._repo) : super(const ApiState.initial());
  final IOrderRepo _repo;

  Future<void> updateOrder(
    List<OrderProductModel> orderPlaceModel,
    String orderID,
  ) async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(
        data: await _repo.updateOrder(orderPlaceModel, orderID),
      );
    } catch (e) {
      debugPrint(e.toString());
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class PickUpScheduleNotifier extends StateNotifier<ApiState<SchedulesModel>> {
  PickUpScheduleNotifier(this._repo, this._date)
      : super(const ApiState.initial()) {
    getPickUpSchedules();
  }
  final IOrderRepo _repo;
  final DateTime _date;
  Future<void> getPickUpSchedules() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(data: await _repo.getPickUpSchedules(_date));
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class DeliveryScheduleNotifier extends StateNotifier<ApiState<SchedulesModel>> {
  DeliveryScheduleNotifier(this._repo, this._date)
      : super(const ApiState.initial()) {
    getDeliverySchedules();
  }
  final IOrderRepo _repo;
  final DateTime _date;
  Future<void> getDeliverySchedules() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(data: await _repo.getDeliverySchedules(_date));
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class CouponNotifier extends StateNotifier<ApiState<CouponResponseModel>> {
  CouponNotifier(this._repo) : super(const ApiState.initial());
  final IOrderRepo _repo;

  Future<void> applyCoupon({
    required String coupon,
    required String amount,
  }) async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(
        data: await _repo.applyCoupon(coupon: coupon, amount: amount),
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}
