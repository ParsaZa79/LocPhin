class MedicalFacility {
  final int id, rate;
  final List<String> numbers, addresses;
  final String name, description, website;
  MedicalFacility(
      {this.id,
      this.name,
      this.addresses,
      this.description,
      this.numbers,
      this.website,
      this.rate});
}

List<MedicalFacility> facilities = [
  MedicalFacility(
      id: 1,
      name: "مرکز فوق تخصصی درمان اوتیسم",
      addresses: [
        "شعبه شرق: ابتدا پاسداران, خیابان نگارستان دوم (کاشیها), خیابان مسجد جامع قدیر خم, نبش نگارستان چهارم, پلاک 11, کلینیک توانبخشی پایا",
        "شعبه غرب: سعادت آباد بلوار پاکنژاد, بالاتر از خیابان سرو غربی, خیابان سپیدار, خیابان شکوفه شمالی, کوچه نظری, پلاک 47, کلینیک توانبخشی غرب تهران"
      ],
      description:
          "ساعت کاری شنبه تا پنجشنبه: از 8:40 صبح تا 20:20 شب | جمعه ها: 8:40 تا 18:00",
      numbers: ["09356117742", "09126117742"],
      website: "www.drhoseinisianaki.com",
      rate: 5),
  MedicalFacility(
      id: 1,
      name: "تهران اتیسم",
      addresses: [
        "تهران، امیرآباد شمالی، بالاتر از چهارراه جلال آل احمد، بین خیابان ۶ و ۷، نبش خیابان ۷، پلاک ۱۸۹۱، مرکز اتیسم"
      ],
      description: "",
      numbers: ["88010162"],
      website: "www.ctad.ir",
      rate: 0),
];
