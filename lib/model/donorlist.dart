import 'package:flutter/material.dart';

class DonorListCardModel {
  final Image photo;
  final String name;
  final String location;
  final String bloodGroup;

  DonorListCardModel({
    required this.photo,
    required this.name,
    required this.location,
    required this.bloodGroup,
  });
}

List<DonorListCardModel> donorDetails = [
  DonorListCardModel(
      photo: Image.asset('assets/donor.png'),
      location: 'Kathmandu',
      name: 'hari',
      bloodGroup: 'AB+'),
  DonorListCardModel(
      photo: Image.asset('assets/donor.png'),
      location: 'Bhaktapur',
      name: 'shyam',
      bloodGroup: 'A+'),
  DonorListCardModel(
      photo: Image.asset('assets/donor.png'),
      location: 'pokhara',
      name: 'gita',
      bloodGroup: 'B+'),
  DonorListCardModel(
      photo: Image.asset('assets/donor.png'),
      location: 'Banepa',
      name: 'rita',
      bloodGroup: 'O+'),
  DonorListCardModel(
      photo: Image.asset('assets/donor.png'),
      location: 'Banepa',
      name: 'rita',
      bloodGroup: 'O+'),
  DonorListCardModel(
      photo: Image.asset('assets/donor.png'),
      location: 'Banepa',
      name: 'rita',
      bloodGroup: 'O+'),
];
