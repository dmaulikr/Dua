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
              @{@"category":@"Ramadan",@"image":@"Ramadan",
                @"duas":@[]},
              @{@"category":@"Bedroom",@"image":@"bedroom",
                @"duas":@[@{
                              @"dua:arabic" : @"الحَمْدُ لِلهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
                              @"dua:transliteration" : @"alḥamdu lillaahil-ladhee aḥyaanaa ba‛da maa amaatanaa wa ilayhin-nushoor",
                              @"dua:translation" : @"Praise be to Allah who gave us life after having given us death, unto Him is [our] final return (Bukhari, Muslim).",
                              @"dua:title" : @"Waking Up",
                              @"searchKeys":@"Waking up, morning, sleep, bed, room"
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
                              @"searchKeys":@"mirror looking look room bedroom "}
                       
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
                @"duas":@[@{
                              @"dua:arabic" : @"بِسْمِ الله وَبَرَكَةِ الله",
                              @"dua:transliteration" : @"Bismi 'Llāhi wa barakati 'Llah(i)",
                              @"dua:translation" : @"In the name of Allah and with the blessings of Allah (Mustadrak).",
                              @"dua:title" : @"Before meal",
                              @"searchKeys":@"before eating food meal dinner lunch breakfast"},
                          @{
                              @"dua:arabic2" : @"الْحَمْدُ لِلهِ الَّذِي أَطْعَمَنِي هَذَا الطَّعَامَ وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ",
                              @"dua:transliteration2" : @"alḥamdu lillaahil-ladhee aṭ‛amanee haadhaa aṭ‛aama wa razaqaneehi min ghayri ḥawlin minnee wa laa quwwah",
                              @"dua:translation2" : @"Praise be to Allah who fed me this food and bestowed it upon me without any strength and ability on my part. (Abū Dāwūd, Tirmidhī)",
                              @"dua:arabic" : @"الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا ْمُسْلِمِينَ",
                              @"dua:transliteration" : @"Al-hamdu li 'Llāhi 'lladhī at'amanā wa saqānā wa ja-'alanā mina 'l-muslimīn",
                              @"dua:translation" : @"Praise be to Allah who fed us and gave us to drink and made us Muslims (Abū Dāwūd, Tirmidhī).",
                              @"dua:title" : @"After meal",
                              @"searchKeys":@"after eating food meal dinner lunch breakfast"},
                          @{
                              @"dua:arabic" : @"بِسْمِ اللهِ فِي أَوَّلِهِ وَآخِرِهِ",
                              @"dua:transliteration" : @"bismillaahi fee awwalihi wa aakhirihi",
                              @"dua:translation" : @"In the name of Allah, at the beginning of it [the meal] and at the end of it (Abū Dāwūd).",
                              @"dua:title" : @"If one forgets supplication prior to meal",
                              @"searchKeys":@"eating food meal dinner lunch breakfast forgets forgot"},
                          @{
                              @"dua:arabic" : @"للَّهمَّ إِنِّي أَسْأَلُكَ بِرَحْمَتِكَ الَّتِي وَسِعَتْ كُلَّ شَيء،ٍ أَنْ تَغْفِرَ لِي",
                              @"dua:transliteration" : @"Allahumma innee as'aluka bi-rahmatikal-latee wasi'ath kulla shai'in an taghfira lee.",
                              @"dua:translation" : @"O Allah, Verily I ask You, bu Your mercy which encompasses everything , to forgive me (Ign Mãja)",
                              @"dua:arabic2" : @"اللَّهُمَّ لَكَ صُمْتُ وَعَلَى رِزْقِكَ اَفْطَرْتُ",
                              @"dua:transliteration2" : @"Allāhumma laka sumtu wa 'ala rizqika aftart(u)",
                              @"dua:translation2" : @"O Allah, for You have I fasted, and by what [food] You have blessed me with have I broken it (Abū Dāwūd in his Marāsīl)",
                              @"dua:title" : @"Breaking one's fast",
                              @"searchKeys":@"breaking fast fasting iftar ramadan food"},
                          @{
                              @"dua:arabic" : @"اللَّهُمَّ أَطْعِمْ مَنْ أَطْعَمَنِي وَاسْقِ مَنْ سَقَانِي",
                              @"dua:transliteration" : @"Allahuma at'im man at'amani wa'sqi man saqānī",
                              @"dua:translation" : @"O Allah, feed those who have fed me and sate those who have sated me (Muslim).",
                              @"dua:title" : @"Dining at someone's house",
                              @"searchKeys":@"dining eat food eating dinner"},
                          @{
                              @"dua:arabic" : @"اللَّهُمَّ بَارِكْ لَنَا فِيهِ وَزِدْنَا مِنْهُ",
                              @"dua:transliteration" : @"allaahumma baarik lanaa feehi wa zidnaa minh",
                              @"dua:translation" : @"O Allah, bless us by it, and increase us in it (Tirmidhi).",
                              @"dua:title" : @"After drinking milk",
                              @"searchKeys":@"after drinking milk drink food"},
                          @{
                              @"dua:arabic" : @"اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمَاً نَافِعَاًً وَرِزْقَاً وَاسِعَاًَ وَشِفَاءً مِنْ كُلِّ دَاءٍ",
                              @"dua:transliteration" : @"Allahuma innī as'aluka 'ilman nāfi-'aw wa rizqaw wāsi-'aw wa shifā'am min kulli dā(in)",
                              @"dua:translation" : @"O Allah, I ask of You, beneficial knowledge, ample provisions, and restoration from every ilness (Mustadrak).",
                              @"dua:title" : @"After drinking Zam Zam",
                              @"searchKeys":@"after drinking zam zam food drink"}
]},
              @{@"category":@"Family",@"image":@"family",
                @"duas":@[
                        @{
                            @"dua:arabic" : @"",
                            @"dua:transliteration" : @"",
                            @"dua:translation" : @"",
                            @"dua:title" : @"",
                            @"searchKeys":@""},
                        @{
                            @"dua:arabic" : @"رَبِّ لَا تَذَرۡنِى فَرۡدً۬ا وَأَنتَ خَيۡرُ ٱلۡوَٲرِثِينَ",
                            @"dua:transliteration" : @"rabbi la tadharnee fardan waanta khayru alwaritheen",
                            @"dua:translation" : @"O my Lord! Leave me not without offspring; You are the best of inheritors (Qur'an 21:89)",
                            @"dua:title" : @"Supplication to have children",
                            @"searchKeys":@"Children family child kid birth"},
                        @{
                            @"dua:arabic" : @" رَبَّنَا هَبۡ لَنَا مِنۡ أَزۡوَٲجِنَا وَذُرِّيَّـٰتِنَا قُرَّةَ أَعۡيُنٍ۬ وَٱجۡعَلۡنَا لِلۡمُتَّقِينَ إِمَامًا",
                            @"dua:transliteration" : @"Rabbanā hab lanā min azwājinā wa dhurriyyātinā qurrata a'yun(iw), wa'jalnā li'l-muttaqīna imāman",
                            @"dua:translation" : @"Our Lord! Grant us spouses and offspring that will be the comfort of our eyes, and give us [the grace] to leave the righteous (Qur'ān 25:74)",
                            @"dua:title" : @"Supplication to have a blessed family",
                            @"searchKeys":@"family blessed children spouse wife husband bless"}


]},
              @{@"category":@"Social",@"image":@"social",
                @"duas":@[@{
                              @"dua:arabic" : @"سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ ، أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا أَنْتَ ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ",
                              @"dua:transliteration" : @"subḥaanak-allaahumma wa bi ḥamdika, ash-hadu an laa ilaaha illaa anta, astaghfiruka wa atoobu ilayk",
                              @"dua:translation" : @"Exalted are you, O Allah, by Your praise: I bear witness that there is no god but You. I seek forgiveness from You and I repent to you\nVirtue - Whoever recites this dua will hav all the sins commited by him in the gathering forgiven (Tirmidhi, Mustadrak).",
                              @"dua:title" : @"At the end of a gathering",
                              @"searchKeys":@"social gathering ending end friends"},
                          @{
                              @"dua:arabic" : @"جَزَاكَ اللهُ خَيْرًا",
                              @"dua:transliteration" : @"jazaak-allaahu khayran",
                              @"dua:translation" : @"May Allah reward you well (Tirmidhi).",
                              @"dua:title" : @"When thanking somebody",
                              @"searchKeys":@"thanking people friends social"},
                          @{
                              @"dua:arabic" : @"أَضْحَكَ اللَّهُ سِنَّكَ",
                              @"dua:transliteration" : @"",
                              @"dua:translation" : @"May Allah fill your life with laughter (Bukhāri, Abū Dawūd).",
                              @"dua:title" : @"When seeing a muslim happy",
                              @"searchKeys":@"seeing muslim happy when social friends friend"}


]},
              @{@"category":@"Business",@"image":@"business",
                @"duas":@[  @{
                                @"dua:arabic" : @"لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ ، يُحْيِي وَيُمِيتُ وَهُوَ حَيٌّ لَا يَمُوتُ ، بِيَدِهِ الْخَيْرُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ",
                                @"dua:transliteration" : @"laa ilaaha ill-allaahu waḥdahu laa shareeka lah, lah-ul-mulku wa lahul-ḥamdu, yuḥyee wa yumeetu wa huwa ḥayun laa yamootu, bi yadi-hil-khayru, wa huwa ‛alaa kulli shay’in qadeer",
                                @"dua:translation" : @"There is no god but Allah. He is one and has no partner. His is the Kingdom and to Him is all praise. He gives life and gives death. He is living, not subject to death. In His hand is goodness and He has power over all things.\nVirtue - Whoever recites this dua, Allah will reward him with a million good deeds, forgive a million of his sins, and raise his rank by a million degrees (Tirmidhī, Mustadrak).",
                                @"dua:title" : @"When entering a market/shop",
                                @"searchKeys":@"market store shop shopping buy buying finance business"
                                },
                            @{
                                @"dua:arabic" : @"اللَّهُمَّ اكْفِنِي بِحَلالِكَ عَنْ حَرَامِكَ ، وَأَغْنِنِي بِفَضْلِكَ عَمَّنْ سِوَاكَ",
                                @"dua:transliteration" : @"allaahummak-finee bi ḥalaalika ‛an ḥaraamika, wa aghninee bi faḍlika ‛amman siwaak",
                                @"dua:translation" : @"O Allah suffice me with what You have made lawful in place of what You have made unlawful, and by Your grace free me of the need for anyone besides You (Tirmidhi).",
                                @"dua:title" : @"When becoming frustrated about paying a debt",
                                @"searchKeys":@"debt business money paying frustrated"}

]},
              @{@"category":@"Masjid",@"image":@"mosque",
                @"duas":@[
                        @{
                            @"dua:arabic" : @"اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
                            @"dua:transliteration" : @"allaahum-maf-taḥ lee abwaaba raḥmatik",
                            @"dua:translation" : @"O Allah, open for me the doors of Your mercy.\n\nBefore reciting this dua, one should send blessings and salutations upon the Messenger of Allah (Muslim).",
                            @"dua:title" : @"Upon entering the Masjid",
                            @"searchKeys":@"masjid mosque entering"},
                        @{
                            @"dua:arabic" : @"اللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ وَالصَّلاةِ الْقَائِمَةِ آتِ مُحَمَّدًا الوَسِيلَةَ وَالْفَضِيلَةَ وَابْعَثْهُ مَقَامًا مَحْمُودًا الَّذِي وَعَدْتَه",
                            @"dua:transliteration" : @"allaahumma rabba haadhi-hid-da‛watit-taammah, waṣ-ṣalaatil-qaa’imah, aati muḥammadan-il-waseelata wal-faḍeelah, wab‛ath-hu maqaaman maḥmoodan-illadhee wa‛adtah",
                            @"dua:translation" : @"O Allah, Lord of this perfect call and established prayer, grant Muhammad a place near to You, an excellence and exalted degree, and raise him to the praiseworthy station that you have promised him. (Bukhārī)",
                            @"dua:title" : @"After the Adhan",
                            @"searchKeys":@"adhan azan masjid"},
                        @{
                            @"dua:arabic" : @"اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ",
                            @"dua:transliteration" : @"allaa-hum-ma innee as’aluka min faḍ-lik",
                            @"dua:translation" : @"O Allah, I ask of You Your favor (Muslim).",
                            @"dua:title" : @"After exiting the masjid",
                            @"searchKeys":@"exit exiting masjid mosque leaving leave"}


]},
              @{@"category":@"Travel",@"image":@"travel",
                @"duas":@[
                        @{
                            @"dua:arabic" : @"  بِسْمِ اللهِ تَوَكَّلْتُ عَلَى اللهِ،اللَّهُمَّ إني أَعُوذُ بِكَ أَنْ أَضِلَّ أَوْ أُضَلَّ ، أَوْ أَزِلَّ أَوْ أُزَلَّ ، أَوْ أَظْلِمَ أَوْ أُظْلَمَ ، أَوْ أَجْهَلَ أَوْ يُجْهَلَ عَلَيَّ",
                            @"dua:transliteration" : @"allaahumma innee a‛oodhu bika an aḍilla aw uḍalla, aw azilla aw uzalla, aw aẓlima aw uẓlama, aw ajhala aw yujhala ‛alayy",
                            @"dua:translation" : @"In the name of Allah, I trust in Allah. O Allah I seek protection from misleading and being mislead, from causing someone to slip or slipping, from oppressing and oppression, and from promoting folly and being foolish (Abū Dawūd)",
                            @"dua:arabic2" : @"بِسْمِ اللهِ ، تَوَكَّلْتُ عَلَى اللهِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ",
                            @"dua:transliteration2" : @"bismillaah, tawakkaltu ‛alal-laah, wa laa ḥawla wa laa quwwata illaa billaah",
                            @"dua:translation2" : @"In the name of Allah, I depend on Allah and there is no power [to do good] or restraint [to avoid evil] except with Allah",
                            @"dua:title" : @"When leaving home",
                            @"searchKeys":@"dua leaving home house exit leave"},
                        @{
                            @"dua:arabic" : @"بِسْمِ اللهِ الْحَمْدُ لِلهِ ، سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ ، وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ ، الْحَمْدُ لِلهِ ، الْحَمْدُ لِلهِ ، الْحَمْدُ لِلهِ ، اللهُ أَكْبَرُ ، اللهُ أَكْبَرُ ، اللهُ أَكْبَرُ ، سُبْحَانَكَ اللَّهُمَّ إِنِّي ظَلَمْتُ نَفْسِي فَاغْفِرْ لِي ، فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ",
                            @"dua:transliteration" : @"bismillaah al-ḥamdu lillaahi, subḥaan-alladhee sakhkhara lanaa haadhaa wa maa kunnaa lahu muqrineen, wa innaa ilaa rabbinaa la munqaliboon\nal-ḥamdu lillaah, al-ḥamdu lillaah, al-ḥamdu lillaah, allaahu akbar, allaahu akbar, allaahu akbar\nsubḥaanak-allaahumma innee ẓalamtu nafsee faghfir lee, fa innahu laa yaghfir-udh-dhunooba illaa ant ",
                            @"dua:translation" : @"Upon mounting the beast or the vehicle: 'In the name of Allah' and then say after mounting the beast, or having already settled in the vehicle: 'All praise is for Allah. How far from imperfections He is, the One Who has placed this (transport) at our service and we ourselves would not have been capable of that, and to our Lord is our final destiny. All praise is for Allah, All praise is for Allah, All praise is for Allah, Allah is the greatest, Allah is the greatest, Allah is the greatest. How far from imperfections You are, O Allah, verily I have wronged my soul, so forgive me, for surely none can forgive sins except You.'\nNote: The prophet of Allah (may the Peace and Blessing of Allah be upon him): Allah approves of his slave when he says: 'forgive me my sins', and would say: 'he knows that non forgives the sins but Me' (Abū Dawūd).",
                            @"dua:title" : @"When boarding a vehicle/mounting animal",
                            @"searchKeys":@"car travel traveling vehicle mounting animal trip"},
                        @{
                            @"dua:arabic" : @"آيِبُونَ تَائِبُونَ عَابِدُونَ لِرَبِّنَا حَامِدُونَ",
                            @"dua:transliteration" : @"aayiboona taa’iboona ‛aabidoona li rabbinaa ḥaamidoon",
                            @"dua:translation" : @"We now return [from our journey] repenting [to Allah], worshipping [Him], and praising our Lord[Allah] (Bukhari).",
                            @"dua:title" : @"When returning home from journey",
                            @"searchKeys":@"return returning journey home travel traveling"},
#pragma TODO
                        @{
                            @"dua:arabic" : @"للَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ الْمَوْلِجِ وَخَيْرَ الْمَخْرَجِ بِسْمِ اللهِ وَلَجْنَا، وَ بِسْمِ اللهِ خَرَجْنَا، وَعَلَى رَبِّنَا تَوَكَّلْنَا",
                            @"dua:transliteration" : @"Allāhumma innī as'aluka khayra 'l-mawliji wa khayra 'l-makhraj(i), bi",
                            @"dua:translation" : @"",
                            @"searchKeys":@""},
                        @{
                            @"dua:arabic" : @"",
                            @"dua:transliteration" : @"",
                            @"dua:translation" : @"",
                            @"dua:title" : @"When bidding farewell to someone",
                            @"searchKeys":@""}

]},
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

//
//  @{
//@"dua:arabic" : @"",
//@"dua:transliteration" : @"",
//@"dua:translation" : @"",
//@"dua:arabic2" : @"",
//@"dua:transliteration2" : @"",
//@"dua:translation2" : @"",
//@"dua:title" : @"",
//@"searchKeys":@""
//}



@end
