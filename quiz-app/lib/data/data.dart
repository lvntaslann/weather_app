import 'package:flutter/material.dart';
import 'package:quiz_app/model/model.dart';

class Data {
  static List<Category> categories = [
    Category(
      name: 'Galatasaray',
      image: 'assets/galatasaraylogo.png',
      color: Colors.red,
      quizSets: [
        QuizSet(
          name: 'Quiz Set 1',
          questions: [
            Question(
              //questions
              'Galatasaray Spor Kulübü\'nün kurucusu kimdir?',
              [
                //options
                'Ali Sami Yen',
                'Mustafa Kemal Atatürk',
                'Ziya Songülen',
                'Süleyman Seba'
              ],
              //index of correct answer
              0, selectedIndex: 0,
            ),
            Question(
              'Galatasaray, UEFA Süper Kupa\'yı hangi takım karşısında kazanmıştır?',
              ['Real Madrid', 'Liverpool', 'Manchester United', 'Arsenal'],
              3,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray, 1999-2000 sezonunda UEFA Kupası\'nı kazanırken finalde hangi takımı yenmiştir?',
              ['Arsenal', 'Parma', 'Leeds United', 'Mallorca'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın en fazla forma giyen oyuncusu kimdir?',
              [
                'Bülent Korkmaz',
                'Hakan Şükür',
                'Tugay Kerimoğlu',
                'Cüneyt Tanman'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray, UEFA Kupası\'nı kazanarak Avrupa\'da ilk büyük başarısını elde ettiğinde takımın teknik direktörü kimdi?',
              [
                'Fatih Terim',
                'Mircea Lucescu',
                'Mustafa Denizli',
                'Graeme Souness'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın Şampiyonlar Ligi\'nde en iyi derecesi nedir?',
              ['Yarı final', 'Çeyrek final', 'Grup aşaması', 'Son 16'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Galatasaray, Süper Lig tarihinde en fazla gol atan oyuncusu kimdir?',
              ['Hakan Şükür', 'Metin Oktay', 'Tanju Çolak', 'Arda Turan'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Galatasaray\'ın 1988-1989 sezonunda Şampiyon Kulüpler Kupası yarı finalinde karşılaştığı ve elendiği takım hangisidir?',
              ['Steaua Bükreş', 'Benfica', 'Hamburg', 'Nottingham Forest'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın tarihinde en fazla şampiyonluk yaşadığı başkan kimdir?',
              ['Faruk Süren', 'Ünal Aysal', 'Mustafa Cengiz', 'Dursun Özbek'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın altyapısından yetişip Avrupa\'da oynayan ilk futbolcu kimdir?',
              ['Arda Turan', 'Emre Belözoğlu', 'Okan Buruk', 'Semih Kaya'],
              1,
              selectedIndex: 1,
            ),
          ],
        ),
        QuizSet(
          name: 'Quiz Set 2',
          questions: [
            Question(
              'Galatasaray, UEFA Kupası\'nı kazandığı sezonda çeyrek finalde hangi takımı elemiştir?',
              [
                'Mallorca',
                'Bologna',
                'Borussia Dortmund',
                'Deportivo La Coruña'
              ],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Galatasaray\'ın tarihinde en fazla forma giyen yabancı oyuncu kimdir?',
              [
                'Fernando Muslera',
                'Gheorghe Hagi',
                'Claudio Taffarel',
                'Didier Drogba'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın Avrupa kupalarında en fazla gol atan oyuncusu kimdir?',
              ['Hakan Şükür', 'Burak Yılmaz', 'Gheorghe Hagi', 'Didier Drogba'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Galatasaray\'ın Süper Lig tarihinde en fazla asist yapan oyuncusu kimdir?',
              ['Selçuk İnan', 'Arda Turan', 'Hagi', 'Emre Belözoğlu'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın Şampiyonlar Ligi\'nde en genç gol atan oyuncusu kimdir?',
              ['Okan Buruk', 'Emre Belözoğlu', 'Arda Turan', 'Bruma'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Galatasaray\'ın Türk Telekom Stadyumu\'ndaki ilk golünü kim atmıştır?',
              ['Hakan Şükür', 'Milan Baroš', 'Aydın Yılmaz', 'Emre Çolak'],
              2,
              selectedIndex: 2,
            ),
            Question(
              'Galatasaray, Türkiye Kupası\'nı en fazla kazanan oyuncu kimdir?',
              [
                'Hakan Şükür',
                'Bülent Korkmaz',
                'Okan Buruk',
                'Tugay Kerimoğlu'
              ],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Galatasaray\'ın en uzun süre forma giyen yabancı oyuncusu kimdir?',
              ['Fernando Muslera', 'Gheorghe Hagi', 'Cris', 'Claudio Taffarel'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın 2000 yılındaki UEFA Kupası şampiyonluğu sonrasında UEFA\'nın "Yılın Takımı" ödülünü aldığı yıl hangisidir?',
              ['2000', '2001', '2002', '2003'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Galatasaray\'ın Süper Lig\'de en fazla şampiyonluk yaşayan kaptanı kimdir?',
              ['Bülent Korkmaz', 'Selçuk İnan', 'Hakan Şükür', 'Cüneyt Tanman'],
              0,
              selectedIndex: 0,
            ),
          ],
        ),
        QuizSet(
          name: 'Quiz Set 3',
          questions: [
            Question(
              'Galatasaray\'ın en fazla maç kazandığı Süper Lig sezonu hangisidir?',
              ['2011-2012', '2012-2013', '2017-2018', '2018-2019'],
              2,
              selectedIndex: 2,
            ),
            Question(
              'Galatasaray\'ın en fazla asist yapan oyuncusu hangi sezon yapmıştır?',
              ['2011-2012', '2012-2013', '2017-2018', '2018-2019'],
              2,
              selectedIndex: 2,
            ),
            Question(
              'Galatasaray\'ın UEFA Şampiyonlar Ligi\'nde en çok forma giyen oyuncusu kimdir?',
              [
                'Hakan Şükür',
                'Bülent Korkmaz',
                'Fernando Muslera',
                'Gheorghe Hagi'
              ],
              2,
              selectedIndex: 2,
            ),
            Question(
              'Galatasaray\'ın 2012-2013 sezonunda Şampiyonlar Ligi çeyrek finalinde elendiği takım hangisidir?',
              ['Real Madrid', 'Barcelona', 'Bayern Münih', 'Juventus'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın Avrupa kupalarında en fazla oynadığı ülke takımı hangisidir?',
              ['İngiltere', 'İtalya', 'Almanya', 'İspanya'],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Galatasaray\'ın tarihinde en uzun süre teknik direktörlük yapmış isim kimdir?',
              [
                'Fatih Terim',
                'Graeme Souness',
                'Mustafa Denizli',
                'Mircea Lucescu'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın UEFA Şampiyonlar Ligi\'nde çeyrek finale kadar yükseldiği sezon hangisidir?',
              ['1993-1994', '2000-2001', '2012-2013', '2013-2014'],
              2,
              selectedIndex: 2,
            ),
            Question(
              'Galatasaray\'ın Süper Lig\'de namağlup şampiyon olduğu sezon hangisidir?',
              ['1985-1986', '1998-1999', '2001-2002', '2011-2012'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Galatasaray\'ın "Süper Kupa" adıyla bilinen Türkiye Süper Kupa\'yı ilk kez kazandığı yıl hangisidir?',
              ['1966', '1968', '1973', '1982'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Galatasaray\'ın tarihinde en fazla gol atan yabancı oyuncusu kimdir?',
              ['Gomis', 'Mario Jardel', 'Didier Drogba', 'Hagi'],
              0,
              selectedIndex: 0,
            ),
          ],
        ),
      ],
    ),
    Category(
      name: 'Fenerbahçe',
      image: 'assets/fenerbahcelogo.png',
      color: Colors.blue,
      quizSets: [
        QuizSet(
          name: 'Quiz Set 1',
          questions: [
            Question(
              'Fenerbahçe hangi yıl kurulmuştur?',
              ['1907', '1905', '1910', '1903'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin en fazla forma giyen oyuncusu kimdir?',
              [
                'Müjdat Yetkiner',
                'Lefter Küçükandonyadis',
                'Can Bartu',
                'Alex de Souza'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe, UEFA Avrupa Ligi\'nde yarı final oynadığı sezonda hangi takımla karşılaşmıştır?',
              ['Benfica', 'Sevilla', 'Valencia', 'Porto'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin "Sarı Kanaryalar" lakabını kazandığı dönem hangi teknik direktör zamanında olmuştur?',
              ['Didi', 'Vujadin Boškov', 'Christoph Daum', 'Guus Hiddink'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin Şampiyonlar Ligi\'nde çeyrek final oynadığı yıl hangi sezondu?',
              ['2007-2008', '2005-2006', '2012-2013', '2010-2011'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin Süper Lig tarihinde en fazla gol atan oyuncusu kimdir?',
              [
                'Alex de Souza',
                'Aykut Kocaman',
                'Lefter Küçükandonyadis',
                'Tanju Çolak'
              ],
              1,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe, tarihinde ilk kez Türkiye Kupası\'nı hangi yıl kazanmıştır?',
              ['1968', '1974', '1983', '1996'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin Avrupa\'da en çok gol atan oyuncusu kimdir?',
              [
                'Alex de Souza',
                'Pierre van Hooijdonk',
                'Moussa Sow',
                'Elvir Bolic'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin tarihinde en fazla şampiyonluk yaşadığı başkan kimdir?',
              ['Aziz Yıldırım', 'Ali Şen', 'Ali Koç', 'Faruk Ilgaz'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe, Şampiyonlar Ligi\'nde ilk kez grup aşamasını geçtiği sezon hangi takımla aynı grupta yer almıştır?',
              ['Manchester United', 'Inter Milan', 'Barcelona', 'Chelsea'],
              1,
              selectedIndex: 1,
            ),
          ],
        ),
        QuizSet(
          name: 'Quiz Set 2',
          questions: [
            Question(
              'Fenerbahçe\'nin maçlarını oynadığı stadın adı nedir?',
              [
                'Şükrü Saracoğlu Stadyumu',
                'Atatürk Olimpiyat Stadı',
                'Türk Telekom Stadyumu',
                'Vodafone Park'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe, UEFA Avrupa Ligi\'nde yarı finale çıktığı sezon hangi teknik direktör ile çalışıyordu?',
              ['Aykut Kocaman', 'Zico', 'Christoph Daum', 'Dick Advocaat'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin Süper Lig tarihinde en fazla gol atan oyuncusu kimdir?',
              [
                'Alex de Souza',
                'Aykut Kocaman',
                'Lefter Küçükandonyadis',
                'Tanju Çolak'
              ],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Fenerbahçe\'nin ezeli rakibi hangi takımdır?',
              ['Galatasaray', 'Beşiktaş', 'Trabzonspor', 'Bursaspor'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin tarihinde en fazla şampiyonluk yaşadığı başkan kimdir?',
              ['Aziz Yıldırım', 'Ali Şen', 'Ali Koç', 'Faruk Ilgaz'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe, tarihinde ilk kez Türkiye Kupası\'nı hangi yıl kazanmıştır?',
              ['1968', '1974', '1983', '1996'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin Avrupa\'da en çok gol atan oyuncusu kimdir?',
              [
                'Alex de Souza',
                'Pierre van Hooijdonk',
                'Moussa Sow',
                'Elvir Bolic'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe, Şampiyonlar Ligi\'nde ilk kez grup aşamasını geçtiği sezon hangi takımla aynı grupta yer almıştır?',
              ['Manchester United', 'Inter Milan', 'Barcelona', 'Chelsea'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Fenerbahçe\'nin taraftar grubunun adı nedir?',
              ['Genç Fenerbahçeliler', 'UltrAslan', 'Çarşı', 'Teksas'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin altyapısından yetişip Avrupa\'da oynayan ilk futbolcu kimdir?',
              ['Rıdvan Dilmen', 'Tuncay Şanlı', 'Oğuz Çetin', 'Can Bartu'],
              3,
              selectedIndex: 3,
            ),
          ],
        ),
        QuizSet(
          name: 'Quiz Set 3',
          questions: [
            Question(
              'Fenerbahçe, Şampiyonlar Ligi\'nde çeyrek finale yükseldiği sezonda hangi takımı eleyerek çeyrek finale çıktı?',
              ['Sevilla', 'Chelsea', 'Liverpool', 'Bayern Münih'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin kadın basketbol takımı hangi yıl EuroLeague Women\'da şampiyon olmuştur?',
              ['2023', '2020', '2017', '2014'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin voleybol şubesindeki kadın takımı kaç kez Türkiye Ligi şampiyonu olmuştur?',
              ['5', '6', '7', '8'],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Fenerbahçe\'nin tarihi boyunca en uzun süre görev yapan teknik direktörü kimdir?',
              ['Ziya Şengül', 'Christoph Daum', 'Aykut Kocaman', 'Didi'],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Fenerbahçe\'nin tarihinde en fazla gol atan yabancı oyuncusu kimdir?',
              [
                'Alex de Souza',
                'Pierre van Hooijdonk',
                'Nobre',
                'Roberto Carlos'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin Şampiyonlar Ligi gruplarındaki ilk golünü kim atmıştır?',
              ['Elvir Bolic', 'Jay-Jay Okocha', 'Tuncay Şanlı', 'Serhat Akın'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe, tarihinde en fazla Türkiye Kupası kazanan teknik direktör kimdir?',
              ['Aykut Kocaman', 'Christoph Daum', 'Zico', 'Dick Advocaat'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Fenerbahçe\'nin Şükrü Saracoğlu Stadyumu\'nun adı ne zaman Ülker Stadyumu Fenerbahçe Şükrü Saracoğlu Spor Kompleksi olarak değiştirilmiştir?',
              ['2015', '2010', '2020', '2008'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe, UEFA Avrupa Ligi yarı finalinde Benfica ile oynadığı maçı hangi stadyumda oynamıştır?',
              [
                'Şükrü Saracoğlu Stadyumu',
                'Estádio da Luz',
                'Allianz Arena',
                'San Siro'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Fenerbahçe\'nin 1988-1989 sezonunda Şampiyon Kulüpler Kupası çeyrek finalinde karşılaştığı ve elendiği takım hangisidir?',
              ['Steaua Bükreş', 'Benfica', 'Hamburg', 'Nottingham Forest'],
              2,
              selectedIndex: 2,
            ),
          ],
        ),
      ],
    ),
    Category(
      name: 'Beşiktaş',
      image: 'assets/besiktaslogo.png',
      color: Colors.black,
      quizSets: [
        QuizSet(
          name: 'Quiz Set 1',
          questions: [
            Question(
              'Beşiktaş hangi yıl kurulmuştur?',
              ['1903', '1905', '1907', '1910'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın en fazla forma giyen oyuncusu kimdir?',
              ['Rıza Çalımbay', 'Metin Tekin', 'Ali Gültiken', 'Şifo Mehmet'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş, Süper Lig tarihinde ilk şampiyonluğunu hangi yıl kazanmıştır?',
              ['1957', '1959', '1961', '1965'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Beşiktaş\'ın UEFA Şampiyonlar Ligi\'nde gruplardan lider çıktığı sezon hangi yıldır?',
              ['2017-2018', '2015-2016', '2013-2014', '2009-2010'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın tarihinde en fazla gol atan oyuncusu kimdir?',
              ['Hakkı Yeten', 'Ali Gültiken', 'Metin Tekin', 'Feyyaz Uçar'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın en fazla şampiyonluk yaşadığı teknik direktörü kimdir?',
              ['Gordon Milne', 'Şenol Güneş', 'Mustafa Denizli', 'Ersun Yanal'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın ezeli rakibi hangi takımdır?',
              ['Galatasaray', 'Fenerbahçe', 'Trabzonspor', 'Bursaspor'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Beşiktaş\'ın Avrupa kupalarında en çok gol atan oyuncusu kimdir?',
              ['Cenk Tosun', 'Demba Ba', 'Ricardo Quaresma', 'Mario Gomez'],
              2,
              selectedIndex: 2,
            ),
            Question(
              'Beşiktaş\'ın efsanevi kaptanı ve futbolcusu Süleyman Seba, kulübe kaç yıl başkanlık yapmıştır?',
              ['16', '20', '22', '25'],
              2,
              selectedIndex: 2,
            ),
            Question(
              'Beşiktaş\'ın efsanevi "Metin-Ali-Feyyaz" üçlüsünden hangisi en fazla gol atmıştır?',
              [
                'Metin Tekin',
                'Ali Gültiken',
                'Feyyaz Uçar',
                'Hepsi eşit sayıda gol atmıştır'
              ],
              2,
              selectedIndex: 2,
            ),
          ],
        ),
        QuizSet(
          name: 'Quiz Set 2',
          questions: [
            Question(
              'Beşiktaş\'ın maçlarını oynadığı stadın adı nedir?',
              [
                'Vodafone Park',
                'Atatürk Olimpiyat Stadı',
                'Şükrü Saracoğlu Stadyumu',
                'Türk Telekom Stadyumu'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş, UEFA Avrupa Ligi\'nde çeyrek final oynadığı sezonda hangi takımla karşılaşmıştır?',
              ['Olympique Lyon', 'Sevilla', 'Valencia', 'Porto'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın "Kara Kartallar" lakabını kazandığı dönem hangi teknik direktör zamanında olmuştur?',
              ['Süleyman Seba', 'Şeref Bey', 'Necip Uysal', 'Gordon Milne'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Beşiktaş\'ın en fazla Süper Lig şampiyonluğu yaşadığı dönem hangi yıllar arasında olmuştur?',
              ['1989-1992', '1995-1998', '2003-2006', '2015-2018'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın tarihinde en uzun süre görev yapan teknik direktörü kimdir?',
              [
                'Gordon Milne',
                'Şenol Güneş',
                'Samet Aybaba',
                'Mustafa Denizli'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın Süper Lig tarihinde kazandığı ilk derbi maçı hangi takıma karşıdır?',
              ['Galatasaray', 'Fenerbahçe', 'Trabzonspor', 'Bursaspor'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Beşiktaş\'ın UEFA Şampiyonlar Ligi\'nde en çok gol atan oyuncusu kimdir?',
              ['Cenk Tosun', 'Demba Ba', 'Ricardo Quaresma', 'Mario Gomez'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın Avrupa kupalarında en çok forma giyen oyuncusu kimdir?',
              [
                'Rıza Çalımbay',
                'Sergen Yalçın',
                'Atiba Hutchinson',
                'Gökhan Töre'
              ],
              2,
              selectedIndex: 2,
            ),
            Question(
              'Beşiktaş\'ın tarihinde ilk kez Türkiye Kupası\'nı hangi yıl kazanmıştır?',
              ['1966', '1974', '1984', '1990'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın altyapısından yetişip Avrupa\'da oynayan ilk futbolcu kimdir?',
              ['Rıdvan Dilmen', 'Nihat Kahveci', 'Oğuz Çetin', 'Metin Tekin'],
              1,
              selectedIndex: 1,
            ),
          ],
        ),
        QuizSet(
          name: 'Quiz Set 3',
          questions: [
            Question(
              'Beşiktaş, UEFA Şampiyonlar Ligi gruplarında ilk galibiyetini hangi takım karşısında almıştır?',
              ['Chelsea', 'Barcelona', 'PSG', 'Manchester United'],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Beşiktaş\'ın en fazla gol atan yabancı oyuncusu kimdir?',
              ['Demba Ba', 'Mario Gomez', 'Ricardo Quaresma', 'Fernandão'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Beşiktaş\'ın efsanevi "Şifo Mehmet" lakaplı futbolcusu kimdir?',
              [
                'Mehmet Özdilek',
                'Mehmet Topal',
                'Mehmet Aurelio',
                'Mehmet Ekici'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın tarihinde en fazla Türkiye Kupası kazanan teknik direktör kimdir?',
              ['Gordon Milne', 'Şenol Güneş', 'Mustafa Denizli', 'Ersun Yanal'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın tarihinde en fazla gol atan savunma oyuncusu kimdir?',
              [
                'Gökhan Gönül',
                'Ricardo Quaresma',
                'Ersan Gülüm',
                'Daniel Pancu'
              ],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Beşiktaş\'ın Şampiyonlar Ligi gruplarındaki ilk golünü kim atmıştır?',
              ['Toshack', 'Sergen Yalçın', 'Nihat Kahveci', 'Alpay Özalan'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Beşiktaş, Süper Lig tarihinde en fazla puan toplayarak şampiyon olduğu sezon hangisidir?',
              ['2002-2003', '2008-2009', '2015-2016', '2016-2017'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın Süper Lig\'de namağlup şampiyon olduğu sezon hangi yıldır?',
              ['1991-1992', '1981-1982', '1973-1974', '2002-2003'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın UEFA Avrupa Ligi çeyrek finalinde oynadığı ve penaltılarla elendiği maç hangi takımla oynanmıştır?',
              ['Lyon', 'Sevilla', 'Porto', 'Valencia'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Beşiktaş\'ın efsanevi taraftar grubu "Çarşı" ne zaman kurulmuştur?',
              ['1982', '1992', '2002', '2012'],
              0,
              selectedIndex: 0,
            ),
          ],
        ),
      ],
    ),
    Category(
      name: 'Trabzonspor',
      image: 'assets/trabzonlogo.png',
      color: Color.fromARGB(255, 128, 8, 8),
      quizSets: [
        QuizSet(
          name: 'Quiz Set 1',
          questions: [
            Question(
              'Trabzonspor hangi yıl kurulmuştur?',
              ['1967', '1968', '1969', '1970'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un en fazla forma giyen oyuncusu kimdir?',
              [
                'Hami Mandıralı',
                'Ali Kemal Denizci',
                'Şota Arveladze',
                'Turgay Semercioğlu'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor, Süper Lig tarihinde ilk şampiyonluğunu hangi yıl kazanmıştır?',
              ['1975-1976', '1976-1977', '1978-1979', '1979-1980'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un UEFA Şampiyonlar Ligi\'nde gruplardan lider çıktığı sezon hangi yıldır?',
              ['Hiçbir zaman', '2011-2012', '2013-2014', '2015-2016'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un tarihinde en fazla gol atan oyuncusu kimdir?',
              [
                'Hami Mandıralı',
                'Ali Kemal Denizci',
                'Şota Arveladze',
                'Fatih Tekke'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un en fazla şampiyonluk yaşadığı teknik direktörü kimdir?',
              [
                'Ahmet Suat Özyazıcı',
                'Şenol Güneş',
                'Özkan Sümer',
                'Mustafa Reşit Akçay'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un ezeli rakibi hangi takımdır?',
              ['Fenerbahçe', 'Beşiktaş', 'Galatasaray', 'Bursaspor'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un Avrupa kupalarında en çok gol atan oyuncusu kimdir?',
              [
                'Fatih Tekke',
                'Şota Arveladze',
                'Ricardo Quaresma',
                'Mario Gomez'
              ],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Trabzonspor\'un efsanevi kaptanı ve futbolcusu Hami Mandıralı, kulübe kaç yıl başkanlık yapmıştır?',
              ['Hiçbir zaman', '5', '10', '15'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un efsanevi "Şota" lakaplı futbolcusu kimdir?',
              [
                'Şota Arveladze',
                'Hami Mandıralı',
                'Fatih Tekke',
                'Gökdeniz Karadeniz'
              ],
              0,
              selectedIndex: 0,
            ),
          ],
        ),
        QuizSet(
          name: 'Quiz Set 2',
          questions: [
            Question(
              'Trabzonspor\'un maçlarını oynadığı stadın adı nedir?',
              [
                'Şenol Güneş Stadyumu',
                'Hüseyin Avni Aker Stadyumu',
                'Türk Telekom Stadyumu',
                'Vodafone Park'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor, UEFA Avrupa Ligi\'nde çeyrek final oynadığı sezonda hangi takımla karşılaşmıştır?',
              ['Juventus', 'Liverpool', 'Inter Milan', 'Chelsea'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Trabzonspor\'un "Karadeniz Fırtınası" lakabını kazandığı dönem hangi teknik direktör zamanında olmuştur?',
              [
                'Ahmet Suat Özyazıcı',
                'Şenol Güneş',
                'Özkan Sümer',
                'Mustafa Reşit Akçay'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un en fazla Süper Lig şampiyonluğu yaşadığı dönem hangi yıllar arasında olmuştur?',
              ['1975-1984', '1985-1994', '1995-2004', '2005-2014'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un tarihinde en uzun süre görev yapan teknik direktörü kimdir?',
              [
                'Ahmet Suat Özyazıcı',
                'Şenol Güneş',
                'Özkan Sümer',
                'Mustafa Reşit Akçay'
              ],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Trabzonspor\'un Süper Lig tarihinde kazandığı ilk derbi maçı hangi takıma karşıdır?',
              ['Galatasaray', 'Fenerbahçe', 'Beşiktaş', 'Bursaspor'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Trabzonspor\'un UEFA Şampiyonlar Ligi\'nde en çok gol atan oyuncusu kimdir?',
              [
                'Fatih Tekke',
                'Şota Arveladze',
                'Ricardo Quaresma',
                'Mario Gomez'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un Avrupa kupalarında en çok forma giyen oyuncusu kimdir?',
              [
                'Hami Mandıralı',
                'Şota Arveladze',
                'Fatih Tekke',
                'Gökdeniz Karadeniz'
              ],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Trabzonspor\'un tarihinde ilk kez Türkiye Kupası\'nı hangi yıl kazanmıştır?',
              ['1976', '1980', '1984', '1988'],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un altyapısından yetişip Avrupa\'da oynayan ilk futbolcu kimdir?',
              [
                'Gökdeniz Karadeniz',
                'Fatih Tekke',
                'Şota Arveladze',
                'Hami Mandıralı'
              ],
              1,
              selectedIndex: 1,
            ),
          ],
        ),
        QuizSet(
          name: 'Quiz Set 3',
          questions: [
            Question(
              'Trabzonspor, UEFA Şampiyonlar Ligi gruplarında ilk galibiyetini hangi takım karşısında almıştır?',
              ['Chelsea', 'Barcelona', 'PSG', 'Manchester United'],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Trabzonspor\'un en fazla gol atan yabancı oyuncusu kimdir?',
              [
                'Şota Arveladze',
                'Fatih Tekke',
                'Ricardo Quaresma',
                'Gökdeniz Karadeniz'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un efsanevi "Şota" lakaplı futbolcusu kimdir?',
              [
                'Şota Arveladze',
                'Fatih Tekke',
                'Hami Mandıralı',
                'Gökdeniz Karadeniz'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un tarihinde en fazla Türkiye Kupası kazanan teknik direktör kimdir?',
              [
                'Ahmet Suat Özyazıcı',
                'Şenol Güneş',
                'Özkan Sümer',
                'Mustafa Reşit Akçay'
              ],
              0,
              selectedIndex: 0,
            ),
            Question(
              'Trabzonspor\'un tarihinde en fazla gol atan savunma oyuncusu kimdir?',
              [
                'Gökdeniz Karadeniz',
                'Hami Mandıralı',
                'Fatih Tekke',
                'Giray Kaçar'
              ],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Trabzonspor\'un Şampiyonlar Ligi gruplarındaki ilk golünü kim atmıştır?',
              [
                'Şota Arveladze',
                'Fatih Tekke',
                'Gökdeniz Karadeniz',
                'Hami Mandıralı'
              ],
              2,
              selectedIndex: 2,
            ),
            Question(
              'Trabzonspor, Süper Lig tarihinde en fazla puan toplayarak şampiyon olduğu sezon hangisidir?',
              ['1975-1976', '1983-1984', '2010-2011', '2021-2022'],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Trabzonspor\'un Süper Lig\'de namağlup şampiyon olduğu sezon hangi yıldır?',
              ['1975-1976', '1983-1984', '2010-2011', '2021-2022'],
              3,
              selectedIndex: 3,
            ),
            Question(
              'Trabzonspor\'un UEFA Avrupa Ligi çeyrek finalinde oynadığı ve penaltılarla elendiği maç hangi takımla oynanmıştır?',
              ['Juventus', 'Liverpool', 'Inter Milan', 'Chelsea'],
              1,
              selectedIndex: 1,
            ),
            Question(
              'Trabzonspor\'un efsanevi taraftar grubu "Forza Trabzon" ne zaman kurulmuştur?',
              ['1992', '1995', '1998', '2002'],
              2,
              selectedIndex: 2,
            ),
          ],
        ),
      ],
    ),
  ];
}
