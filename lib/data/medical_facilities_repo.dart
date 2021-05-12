import '../models/medical_facility.dart';
import 'package:flutter/material.dart';

const facilities = const [
  MedicalFacility(
      id: 1,
      name: "مرکز درمان اوتیسم",
      color: Colors.cyan,
      addresses: [
        "شعبه شرق: ابتدا پاسداران, خیابان نگارستان دوم (کاشیها), خیابان مسجد جامع قدیر خم, نبش نگارستان چهارم, پلاک 11, کلینیک توانبخشی پایا",
        "شعبه غرب: سعادت آباد بلوار پاکنژاد, بالاتر از خیابان سرو غربی, خیابان سپیدار, خیابان شکوفه شمالی, کوچه نظری, پلاک 47, کلینیک توانبخشی غرب تهران"
      ],
      description:
          "ساعت کاری شنبه تا پنجشنبه: از 8:40 صبح تا 20:20 شب | جمعه ها: 8:40 تا 18:00",
      numbers: ["09356117742", "09126117742"],
      website: "www.drhoseinisianaki.com",
      rate: 5,
      imageURL: 'assets/images/one.png'),
  MedicalFacility(
      id: 2,
      name: "تهران اتیسم",
      color: Colors.amber,
      addresses: [
        "تهران، امیرآباد شمالی، بالاتر از چهارراه جلال آل احمد، بین خیابان ۶ و ۷، نبش خیابان ۷، پلاک ۱۸۹۱، مرکز اتیسم"
      ],
      description: "",
      numbers: ["88010162"],
      website: "www.ctad.ir",
      rate: 0,
      imageURL: 'assets/images/two.png'),
];
