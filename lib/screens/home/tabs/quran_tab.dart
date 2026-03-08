import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/cache_helper.dart';
import '../../../core/styles.dart';
import '../../../models/sura_model.dart';
import '../../sura_details/sura_details.dart';
import '../widgets/sura_item.dart';


class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> surasNameAr = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];

  List<String> surasNameEn = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajdah",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiyah",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'ah",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahanah",
    "As-Saff",
    "Al-Jumu'ah",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Layl",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyinah",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'ah",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas",
  ];

  List<int> versesCount = [
    7,
    286,
    200,
    176,
    120,
    165,
    206,
    75,
    129,
    109,
    123,
    111,
    43,
    52,
    99,
    128,
    111,
    110,
    98,
    135,
    112,
    78,
    118,
    64,
    77,
    227,
    93,
    88,
    69,
    60,
    34,
    30,
    73,
    54,
    45,
    83,
    182,
    88,
    75,
    85,
    54,
    53,
    89,
    59,
    37,
    35,
    38,
    29,
    18,
    45,
    60,
    49,
    62,
    55,
    78,
    96,
    29,
    22,
    24,
    13,
    14,
    11,
    11,
    18,
    12,
    12,
    30,
    52,
    52,
    44,
    28,
    28,
    20,
    56,
    40,
    31,
    50,
    40,
    46,
    42,
    29,
    19,
    36,
    25,
    22,
    17,
    19,
    26,
    30,
    20,
    15,
    21,
    11,
    8,
    8,
    19,
    5,
    8,
    8,
    11,
    11,
    8,
    3,
    9,
    5,
    4,
    7,
    3,
    6,
    3,
    5,
    4,
    5,
    6,
  ];

  List<SuraModel> suraListData = [];
  List<SuraModel> filteredSuraListData = [];

  @override
  void initState() {
    super.initState();
    createSuras();
    filteredSuraListData = suraListData;
  }

  createSuras() {
    for (int i = 0; i < surasNameEn.length; i++) {
      suraListData.add(
        SuraModel(
          nameAr: surasNameAr[i],
          nameEn: surasNameEn[i],
          versesCount: versesCount[i],
          index: i + 1,
        ),
      );
    }
  }

  TextEditingController searchController = TextEditingController();

  _filterData(String value) {
    filteredSuraListData = suraListData.where((element) {
      return element.nameAr.contains(value) ||
          element.index == int.parse(value) ||
          element.nameEn.toLowerCase().contains(value.toLowerCase());
    }).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> mostRecentList =
        CacheHelper.getSurasList()?.reversed.toList() ?? [];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quran_bg.png"),
          fit: BoxFit.cover,
          opacity: .2,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 192),
            TextField(
              controller: searchController,

              onChanged: (value) {
                _filterData(value);
              },
              cursorColor: AppColors.primary,
              style: AppStyles.large,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                hintText: "Sura Name",
                hintStyle: AppStyles.large,
                prefixIcon: Image.asset(
                  "assets/images/ic_quran.png",
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: 20),

            if (mostRecentList.isNotEmpty) ...[
              Text("most Recently", style: AppStyles.large),
              SizedBox(height: 10),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: mostRecentList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 160,
                      padding: EdgeInsets.all(17),
                      width: 283,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  surasNameEn[int.parse(mostRecentList[index])],
                                  style: AppStyles.titleStyle.copyWith(
                                    color: Color(0xFF202020),
                                  ),
                                ),
                                Text(
                                  surasNameAr[int.parse(mostRecentList[index])],
                                  style: AppStyles.titleStyle.copyWith(
                                    color: Color(0xFF202020),
                                  ),
                                ),
                                Text(
                                  "${versesCount[int.parse(mostRecentList[index])]} Verses",
                                  style: AppStyles.titleStyle.copyWith(
                                    color: Color(0xFF202020),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              "assets/images/img_most_recent.png",
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
            ],

            Text("Suras List", style: AppStyles.large),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.white, indent: 44, endIndent: 44),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => InkWell(
                  onTap: () async {
                    await CacheHelper.saveSurasList(index);
                    setState(() {});
                    Navigator.pushNamed(
                      context,
                      SuraDetailsScreen.routeName,

                      arguments: filteredSuraListData[index],
                    );
                  },
                  child: SuraItem(model: filteredSuraListData[index]),
                ),
                itemCount: filteredSuraListData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
