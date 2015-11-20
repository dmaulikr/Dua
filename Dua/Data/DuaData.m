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
              @{@"category":@"Bedroom",@"image":@"Mosque1",
                @"duas":@[@{
                              @"dua:image" : @"Mosque1",
                              @"dua:arabic" : @"الحَمْدُ لِلهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:translation" : @"Praise be to Allah who gave us life after having given us death, unto Him is [our] final return (Bukhari, Muslim).",
                              @"dua:title" : @"Waking Up",
                              @"isFavorite" : @"NO",
                              @"searchKeys":@""},
                          
                          @{
                              @"dua:image" : @"Mosque2",
                              @"dua:arabic" : @"بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
                              @"dua:arabic2": @"اللهُمَّ أَسْلَمْتُ نَفْسِي إِلَيْكَ، وَوَجَّهْتُ وَجْهِي إِلَيْكَ، وَأَلْجَأْتُ ظَهْرِي إِلَيْكَ، وَفَوَّضْتُ أَمْرِي إِلَيْكَ، رَغْبَةً وَرَهْبَةً إِلَيْكَ، لَا مَلْجَأَ وَلَا مَنْجَا مِنْكَ إِلَّا إِلَيْكَ، آمَنْتُ بِكِتَابِكَ الَّذِي أَنْزَلْتَ، وَبِنَبِيِّكَ الَّذِي أَرْسَلْتَ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:translation" : @"In Your name O Allah, I die and live. (Bukhari)",
                              @"dua:translation2" : @"O Allah, I submit my soul unto You, and I turn my face towards You, and I totally rely on You, and I entrust my affair unto You, in hope and fear of You. Verily, there is no refuge nor safe haven from You except with You. I believe in Your Book which You have sent down and in Your Prophet whom You have sent. (Bukhari, Muslim)",
                              @"dua:title" : @"Going to Sleep",
                              @"isFavorite" : @"NO",
                              @"searchKeys":@""},
                          
                          @{
                              @"dua:image" : @"Mosque1",
                              @"dua:arabic" : @"أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّةِ مِنْ غَضَبِهِ وَعِقَابِهِ ، وَشَرِّ عِبَادِهِ وَمِنْ هَمَزَاتِ الشَّيَاطِينِ وَأَنْ يَحْضُرُونِ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:translation" : @"I seek refuge in the perfect words of Allah against His wrath and the evil of His servants and the evil promptings of devils and against their presence (Tirmidhi, Malik).",
                              @"dua:title" : @"After a frightening dream or disturbance",
                              @"isFavorite" : @"NO",
                              @"searchKeys":@""},
                          @{
                              @"dua:image" : @"Mosque1",
                              @"dua:arabic" : @"اللَّهُمَّ غَارَتِ النُّجُومُ، وَهَدَأَتِ الْعُيُونُ، وَأَنْتَ حَيٌّ قَيُّومٌ، لَا تَأْخُذُكَ سِنَةٌ وَلَا نَوْمٌ، يَا حَيُّ يَا قَيُّومُ، أَهْدِئْ لَيْلِي وَأَنِمْ عَيْنِي",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:translation" : @"Oh Allah, the stars have gone and the eyes [of people] have sunken [into deep slumber]. Verily, You are Everlasting and Eternal, neither sleep, nor slumber can seize you. O Everlasting and Eternal, bless my night with peace and my eyes with sleep (Ibn al-Sunni).",
                              @"dua:title" : @"When unable to sleep at night",
                              @"isFavorite" : @"NO",
                              @"searchKeys":@""},
                          @{
                              @"dua:image" : @"Mosque1",
                              @"dua:arabic" : @"الحَمْدُ لِلهِ الَّذِي كَسَانِي هَذَا الثَّوْبَ وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:translation" : @"Praise be to Allah who clothed me in this garment and gave it to me without any strength and ability on my part.",
                              @"dua:title" : @"When putting on an article of clothing",
                              @"isFavorite" : @"NO",
                              @"searchKeys":@""},
                          @{
                              @"dua:image" : @"Mosque1",
                              @"dua:arabic" : @"اللَّهُمَّ لَكَ الْحَمْدُ أَنْتَ كَسَوْتَنِيهِ ، أَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَا صُنِعَ لَهُ ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ وَشَرِّ مَا صُنِعَ لَهُ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:translation" : @"Praise be to Allah who clothed me in this garment and gave it to me without any strength and ability on my part.",
                              @"dua:title" : @"When putting on new clothing",
                              @"isFavorite" : @"NO",
                              @"searchKeys":@""},
                          @{
                              @"dua:image" : @"Mosque1",
                              @"dua:arabic" : @"بِسْمِ اللَّهِ الَّذِي لَا إِلَهَ إِلَّا هُوَ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:translation" : @"In the name of Allah, besides whom there is no good (Ibn al-Sunni).",
                              @"dua:title" : @"Before removing clothing",
                              @"isFavorite" : @"NO",
                              @"searchKeys":@""},
                          @{
                              @"dua:image" : @"Mosque1",
                              @"dua:arabic" : @"الْحَمْدُ لِلَّهِ , اللَّهُمَّ كَمَا أَنْتَ حَسَّنْتَ خَلْقِي فَحَسِّنْ خُلُقِي",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:translation" : @"Praise be to Allah, Oh Allah, as you have given me a good physical form, so favor me with good character (Ibn al-Sunni).",
                              @"dua:title" : @"When looking in the mirror",
                              @"isFavorite" : @"NO",
                              @"searchKeys":@""}
                       
                          ]
                },
              @{@"category":@"Evening",@"image":@"Mosque2",
                @"duas":@[@{
                              @"dua:image" : @"Mosque2",
                              @"dua:arabic" : @"جَنَْهْ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:title" : @"Waking up in the Morning",
                              @"isFavorite" : @"YES",
                              @"searchKeys":@""}
                          ]
                }
              ];
}

@end
