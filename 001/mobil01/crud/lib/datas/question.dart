import 'package:flutter/material.dart';

class QuestionData with ChangeNotifier {
  QuestionData._privateConstructor();
  static final QuestionData _instance = QuestionData._privateConstructor();
  factory QuestionData() => _instance;

  List<Map<String, dynamic>> _questionMap = [
    {
      'questionId': 1,
      'question': '''
Aşağıdaki tümcelerin hangisinde yazım yanlışlarından biri vardır?
''',
      'opt_A': 'İnek Şaban, Hababam Sınıfı romanının ana kahramanlarındandır.',
      'opt_B':
          'Yavuz Sultan Selim Köprüsü, Boğaz üzerinde çok güzel durmaktadır.',
      'opt_C':
          'Doğu ve Batı medeniyetleri birbirinden yüz yıl farklı zamanlarda yaşıyor.',
      'opt_D':
          'Kurban bayramı toplumun her zaman çok önem verdiği bir bayramdır.',
      'opt_E':
          'Mona Lisa tablosu Leonardo da Vinci tarafından kavak bir panoya yapılmıştır.',
      'answer': 'A',
      'answered': '',
      'userId': 1
    },
    {
      'questionId': 2,
      'question':
          '''Aşağıdaki tümcelerin hangisinde noktalama işaretlerinden kaynaklanan bir hata vardır?''',
      'opt_A':
          'Aşık Veysel, şiirlerinde Türkçenin üslup zenginliğini mükemmel kullanmıştır.',
      'opt_B':
          'Öğretmen; romanlardan Tutunamayanlar’ı, şiirlerden ise Çoban Çeşmesi’ni severdi.',
      'opt_C': 'Hem bunu başarmak istiyor, hem de yeterince çalışmıyordu.',
      'opt_D':
          'İnsanlığın her devrinde yeni kuşak; farklı, sabırsız, aceleci olarak görülmüştür.',
      'opt_E':
          'Bu performans, seyircilerin 1/3’üne müsabakayı kazanamayacağımızı düşündürdü.',
      'answer': 'B',
      'answered': '',
      'userId': 2
    },
    {
      'questionId': 3,
      'question': '''
Kıyıda köşedeki su kaynakları birçok balık cinsi için yaşam alanlarının bizler tarafından kirletildiği büyük akarsulara oranla daha güvenli mekanlardır. Fakat bu zamanlarda bu nehirlerde yaşayan binlerce balık başka korkunç tehditle burun buruna geldi: istilacı türler.
Yukarıda altı çizili kelimelerden hangisi sözcük yapısı açısından diğerlerinden farklıdır?''',
      'opt_A': 'V',
      'opt_B': 'IV',
      'opt_C': 'III',
      'opt_D': 'II',
      'opt_E': 'I',
      'answer': 'C',
      'answered': '',
      'userId': 1
    },
    {
      'questionId': 4,
      'question': '''
Etraf iyice aydınlanınca ufacık bir mağara kovuğu bulup ve hemen sığındılar. Ayakta bekliyorlardı, her ikisi de çok üşüyordu. Şapkasının ucundan hâlâ dışarıdaymış gibi sular damlıyordu.
Yukarıdaki tümcelerde aşağıdaki ses olaylarından hangisi bulunmamaktadır?''',
      'opt_A': 'Ünsüz yumuşaması (Ünsüz Değişimi, Değişme)',
      'opt_B': 'Ünlü daralması',
      'opt_C': 'Ünsüz benzeşmesi (Ünsüz Sertleşmesi)',
      'opt_D': 'Ünsüz düşmesi',
      'opt_E': 'Ünlü türemesi',
      'answer': 'D',
      'answered': '',
      'userId': 2
    },
    {
      'questionId': 5,
      'question': '''
Doğada bazı canlıların neslinin tükenmesi, insanlığı tehdit eden en büyük problemlerden biridir. Bilimsel verilere göre canlıların yok oluş hızı, önceki asır boyunca yüz kat kadar yükselmiş. Bu yükseliş; canlıların yok olmasını önlemeye yönelik önemli bir doğayı koruma hedefi olarak karşımıza çıkar. Bu projelerin tespiti ve araştırma yöntemi bulma hususunda bilim adamlarını düşündürmektedir.
Yukarıda altı çizili kelimelerden hangisinin aldığı çekim ekleri diğerlerinden farklıdır?''',
      'opt_A': 'V',
      'opt_B': 'IV',
      'opt_C': 'III',
      'opt_D': 'II',
      'opt_E': 'I',
      'answer': 'E',
      'answered': '',
      'userId': 1
    },
    {
      'questionId': 6,
      'question':
          'Aşağıdaki tümcelerden hangisinde sıfat tamlaması tümcenin öznesi durumundadır.',
      'opt_A':
          'Okulun spor salonu uzun zaman sonra nihayet faaliyete geçmişti.',
      'opt_B':
          'Annemin verdiği harçlıkla karşıdaki bakkaldan soğuk bir gazoz aldım.',
      'opt_C':
          'Kişiye bir huy edindirmeye çalışmak, sanıldığı gibi basit bir şey değildir.',
      'opt_D':
          'Küçüklüğünden kalan anılarında zar zor anımsadığı bir çay bahçesi vardı.',
      'opt_E':
          'Yağmur nedeniyle buğday tarlaları bu yıl bol bol verim almışladı.',
      'answer': 'E',
      'answered': '',
      'userId': 2
    },
    {
      'questionId': 7,
      'question':
          '''Başımıza gelen iyi ya da kötü her hadiseyi Sümerlerdeki insan görünümlü tanrılara bağladığı …. geçişin başlangıcıdır.. Olayların nedenlerini Sümerlerde değil, tabiatta bularak insanlığa katkı sağlar. Döneminde bilime dayandırdığı düşüncelere, fen bilimlerinin anası olarak görülmesini başarır.
Yukarıda numaralanmış eylemsiler tür açısında ikişerli eşleştirilirse hangisi dışarıda kalır?''',
      'opt_A': 'V',
      'opt_B': 'IV',
      'opt_C': 'III',
      'opt_D': 'II',
      'opt_E': 'I',
      'answer': 'A',
      'answered': '',
      'userId': 1
    },
    {
      'questionId': 8,
      'question': '''Sorunun cevabı A, userID 1''',
      'opt_A': 'Cevap A',
      'opt_B': 'Cevap B',
      'opt_C': 'Cevap C',
      'opt_D': 'Cevap D',
      'opt_E': 'Cevap E',
      'answer': 'A',
      'answered': '',
      'userId': 1
    },
    // ].where((element) => element['userId'] == 1).toList();
  ];

  List<Map<String, dynamic>> get questionMap => _questionMap;

  /*
  Mapi çağır
  deleted olanları filtrele
  */

  List<Map<String, dynamic>> filteredQuestionMap(List deletedList) {
    _questionMap
        .removeWhere((element) => deletedList.contains(element['questionId']));
    return _questionMap;
  }

  set questionMap(List<Map<String, dynamic>> value) {
    _questionMap = value;
    notifyListeners();
  }

  void seen(int index, String answer) {
    _questionMap[index]['answered'] = answer;
    notifyListeners();
  }
}
