//
//  DuaData.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/17/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "DuaData.h"

@implementation DuaData

+ (NSArray *)duas{
    return  @[
              @{@"category":@"Bedroom",@"image":@"bedroom",
                @"duas":@[@{
                              @"dua:arabic" : @"الحَمْدُ لِلهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
                              @"dua:transliteration" : @"alḥamdu lillaahil-ladhee aḥyaanaa ba‛da maa amaatanaa wa ilayhin-nushoor",
                              @"dua:translation" : @"Praise be to Allah who gave us life after having given us death, unto Him is [our] final return (Bukhari, Muslim).",
                              @"dua:title" : @"Waking Up",
                              @"searchKeys":@"Waking up, morning, sleep, bed"
                              },
                          
                          @{
                              @"dua:arabic" : @"بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
                              @"dua:arabic2": @"اللهُمَّ أَسْلَمْتُ نَفْسِي إِلَيْكَ، وَوَجَّهْتُ وَجْهِي إِلَيْكَ، وَأَلْجَأْتُ ظَهْرِي إِلَيْكَ، وَفَوَّضْتُ أَمْرِي إِلَيْكَ، رَغْبَةً وَرَهْبَةً إِلَيْكَ، لَا مَلْجَأَ وَلَا مَنْجَا مِنْكَ إِلَّا إِلَيْكَ، آمَنْتُ بِكِتَابِكَ الَّذِي أَنْزَلْتَ، وَبِنَبِيِّكَ الَّذِي أَرْسَلْتَ",
                              @"dua:transliteration" : @"bismika-l-laahumma amoo-tu wa aḥyaa",
                              @"dua:transliteration2" : @"allaahumma aslamtu nafsee ilayk, wa waj-jahtu wajhiya ilayka wa ’alja’tu ẓahree ilayk, wa fawwaḍtu amree ilayk, ragh-batan warah-batan ilayk, laa malja’a wa laa manja minka il-laa ilayk, aamantu bi-kitaa-bika-l-ladhee anzalt, wa bi-nabiyyik-alladhee arsalta",
                              @"dua:translation" : @"In Your name O Allah, I die and live. (Bukhari)",
                              @"dua:translation2" : @"O Allah, I submit my soul unto You, and I turn my face towards You, and I totally rely on You, and I entrust my affair unto You, in hope and fear of You. Verily, there is no refuge nor safe haven from You except with You. I believe in Your Book which You have sent down and in Your Prophet whom You have sent. (Bukhari, Muslim)",
                              @"dua:title" : @"Going to Sleep",
                              @"searchKeys":@"sleep, bed, night"},
                          
                          @{
                              @"dua:arabic" : @"أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّةِ مِنْ غَضَبِهِ وَعِقَابِهِ ، وَشَرِّ عِبَادِهِ وَمِنْ هَمَزَاتِ الشَّيَاطِينِ وَأَنْ يَحْضُرُونِ",
                              @"dua:transliteration" : @"A’oothu Bikalimatil-lahittiammati min Ghadabihi wa’iqabihi-washarri-‘ibadihi Wamin Hamazatish-shayateen wa’an Yahdoroon",
                              @"dua:translation" : @"I seek refuge in the perfect words of Allah against His wrath and the evil of His servants and the evil promptings of devils and against their presence (Tirmidhi, Malik).",
                              @"dua:title" : @"After a frightening dream or disturbance",
                              @"searchKeys":@"dream, sleep, scared, frightened"},
                          @{
                              @"dua:arabic" : @"اللَّهُمَّ غَارَتِ النُّجُومُ، وَهَدَأَتِ الْعُيُونُ، وَأَنْتَ حَيٌّ قَيُّومٌ، لَا تَأْخُذُكَ سِنَةٌ وَلَا نَوْمٌ، يَا حَيُّ يَا قَيُّومُ، أَهْدِئْ لَيْلِي وَأَنِمْ عَيْنِي",
                              @"dua:transliteration" : @"Allâhumma gharatin-nujâmu wa hada’atil uyunu wa anta hayyun qayyumun la ta’khudhuka sinatun wala nawm. Ya hayyu yâ qayyümu ahdi’ layli wa anim ayni.",
                              @"dua:translation" : @"Oh Allah, the stars have gone and the eyes [of people] have sunken [into deep slumber]. Verily, You are Everlasting and Eternal, neither sleep, nor slumber can seize you. O Everlasting and Eternal, bless my night with peace and my eyes with sleep (Ibn al-Sunni).",
                              @"dua:title" : @"When unable to sleep at night",
                              @"searchKeys":@"sleep night bed"},
                          @{
                              @"dua:arabic" : @"الحَمْدُ لِلهِ الَّذِي كَسَانِي هَذَا الثَّوْبَ وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ",
                              @"dua:transliteration" : @"alḥamdu lillaahil-ladhee kasaanee haadhath-thawba wa razaqaneehi min ghayri ḥawlin minnee wa laa quwwah",
                              @"dua:translation" : @"Praise be to Allah who clothed me in this garment and gave it to me without any strength and ability on my part.",
                              @"dua:title" : @"When putting on an article of clothing",
                              @"searchKeys":@"cloth clothes clothing putting article on"},
                          @{
                              @"dua:arabic" : @"اللَّهُمَّ لَكَ الْحَمْدُ أَنْتَ كَسَوْتَنِيهِ ، أَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَا صُنِعَ لَهُ ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ وَشَرِّ مَا صُنِعَ لَهُ",
                              @"dua:transliteration" : @"allaahumma lakal-ḥamdu anta kasawtaneehi, as’aluka min khayrihi wa khayri maa ṣuni‛a lahu, wa ’a‛oodhu bika min sharrihi wa sharri maa ṣuni‛a lah",
                              @"dua:translation" : @"Praise be to Allah who clothed me in this garment and gave it to me without any strength and ability on my part.",
                              @"dua:title" : @"When putting on new clothing",
                              @"searchKeys":@"cloth clothes clothing putting article on new"},
                          @{
                              @"dua:arabic" : @"بِسْمِ اللَّهِ الَّذِي لَا إِلَهَ إِلَّا هُوَ",
                              @"dua:transliteration" : @"Bismillahi alladhee laa ilaaha illaa huwa ",
                              @"dua:translation" : @"In the name of Allah, besides whom there is no good (Ibn al-Sunni).",
                              @"dua:title" : @"Before removing clothing",
                              @"searchKeys":@"cloth clothes clothing putting article on removing before"},
                          @{
                              @"dua:arabic" : @"الْحَمْدُ لِلَّهِ , اللَّهُمَّ كَمَا أَنْتَ حَسَّنْتَ خَلْقِي فَحَسِّنْ خُلُقِي",
                              @"dua:transliteration" : @"Alhumdu lillahi Allahumma kama anta hasanta khalqi fahassin khuluqi",
                              @"dua:translation" : @"Praise be to Allah, Oh Allah, as you have given me a good physical form, so favor me with good character (Ibn al-Sunni).",
                              @"dua:title" : @"When looking in the mirror",
                              @"searchKeys":@"mirror looking look "}
                       
                          ]
                },
              @{@"category":@"Bathroom",@"image":@"bathroom",
                @"duas":@[@{
                              @"dua:arabic" : @"اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ",
                              @"dua:transliteration" : @"allaahumma innee a‛oodhu bika minal-khubuthi wal-khabaa’ith",
                              @"dua:translation" : @"Oh Allah, I seek Your protection from male and female demons (Muslim).",
                              @"dua:title" : @"Before entering the bathroom",
                              @"searchKeys":@"entering bathroom"},
                          @{
                              @"dua:arabic" : @"غُفْرَانَكَ",
                              @"dua:transliteration" : @"ghufraanak",
                              @"dua:translation" : @"I seek Your forgiveness (Abu Dawud).",
                              @"dua:title" : @"After exiting the bathroom",
                              @"searchKeys":@"exiting after bathroom"},
                          @{
                              @"dua:arabic" : @"بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
                              @"dua:transliteration" : @"bismillaah",
                              @"dua:translation" : @"In the name of Allah, the Most Merciful, the Most Gracious.",
                              @"dua:arabic2" : @"اللَّهُمَّ اغْفِرْ لِي ذَنْبِي وَوَسِّعْ لِي فِي دَارِي وَبَارِكْ لِي فِي رِزْقِي",
                              @"dua:transliteration2" : @"Allahumma-gh fir-lee dhan-bee wawass si'lee fi dari wa bariklee fi rizq",
                              @"dua:translation2" : @"Oh Allah, forgive me my sin, make spacious my home and blessed my sustenance (Ibn al-Sunni).",
                              @"dua:title" : @"Before making ablution (wudhu)",
                              @"searchKeys":@"before ablution wudhu wudu"},
                          @{
                              @"dua:arabic" : @"أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدَاً عَبْدَهُ وَرَسُولَهُ",
                              @"dua:transliteration" : @"ash-hadu an laa ilaha ill-allaahu waḥdahu laa shareeka lahu, wa ash-hadu anna muḥammadan ‛abduhu wa rasooluhu",
                              @"dua:translation" : @"I bear witness that there is no god but Allah. He is one and has no partner and I bear witness that Muhammed is His Servant and Messenger.\n\nVirtue - Whoever recites this du'a, the eight doors of Paradise will be opened for him (Muslim).",
                              @"dua:title" : @"After making ablution (wudhu)",
                              @"searchKeys":@"after ablution wudhu wudu"}
                          ]
                },
              @{@"category":@"Food",@"image":@"food",
                @"duas":@[]},
              @{@"category":@"Family",@"image":@"family",
                @"duas":@[]},
              @{@"category":@"Social",@"image":@"social",
                @"duas":@[]},
              @{@"category":@"Business",@"image":@"business",
                @"duas":@[]},
              @{@"category":@"Masjid",@"image":@"mosque",
                @"duas":@[]},
              @{@"category":@"Travel",@"image":@"travel",
                @"duas":@[]},
              @{@"category":@"Marriage",@"image":@"marriage",
                @"duas":@[]},
              @{@"category":@"Health",@"image":@"health",
                @"duas":@[]},
              @{@"category":@"Difficulty",@"image":@"difficulty",
                @"duas":@[]},
              @{@"category":@"Death",@"image":@"death",
                @"duas":@[]},
              @{@"category":@"Miscellaneous",@"image":@"miscellaneous",
                @"duas":@[]}
              ];
}


//@{
//@"dua:arabic" : @"",
//@"dua:transliteration" : @"",
//@"dua:translation" : @"",
//@"dua:title" : @"",
//@"searchKeys":@""}


@end
