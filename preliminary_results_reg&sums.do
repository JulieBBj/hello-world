. /******************************************************************************
>                                 Regressions single 
> *******************************************************************************/
. 
. 
. * Interaction term formulation 
. local y ln_wiesp i.se##i.female alder alder2 utd_vgs utd_b utd_m 

. global sec s_hs s_bah 

. reg ln_gt_sum_1 `y' `sec' if snghnr == 1, r /*incl all people, charity = 0 --> = 1 */ 

* in dataset 2 754 116 people have snghnr == 1. 9 185 ppl mssing due to ln_wiesp == ., 
*who are those with negative or 0 wiesp 

Linear regression                               Number of obs     =  2,744,931
                                                F(9, 2744921)     =    7114.22
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0273
                                                Root MSE          =     1.7877

------------------------------------------------------------------------------
             |               Robust
 ln_gt_sum_1 |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
    ln_wiesp |   .1282338   .0011398   112.51   0.000     .1259999    .1304676
        1.se |    .173147   .0025085    69.03   0.000     .1682305    .1780635
    1.female |   .2237448   .0028018    79.86   0.000     .2182534    .2292363
             |
   se#female |
        1 1  |   .0953049   .0050153    19.00   0.000     .0854751    .1051346
             |
       alder |  -.0054754   .0008597    -6.37   0.000    -.0071603   -.0037904
      alder2 |   .0001379   .0000102    13.57   0.000      .000118    .0001578
     utd_vgs |   .1504554   .0022847    65.85   0.000     .1459775    .1549333
      utd_ba |   .3030016   .0030551    99.18   0.000     .2970137    .3089894
       utd_m |   .0367679   .0034159    10.76   0.000     .0300728     .043463
       _cons |     -1.582    .022116   -71.53   0.000    -1.625347   -1.538654
------------------------------------------------------------------------------

. 
. local y ln_wiesp i.se##i.female alder alder2 utd_vgs utd_b utd_m 

. local sec s_hs s_bah 

. reg ln_gt_sum `y' `sec' if snghnr == 1, r /*excl. all with charity = 0 */

* Only 160 567 ppl who are both single and ln_gt_sum != . 

Linear regression                               Number of obs     =    160,401
                                                F(11, 160389)     =     440.44
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0304
                                                Root MSE          =     1.0408

------------------------------------------------------------------------------
             |               Robust
   ln_gt_sum |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
    ln_wiesp |   .1981716   .0065297    30.35   0.000     .1853736    .2109696
        1.se |   .1480037   .0083718    17.68   0.000     .1315952    .1644122
    1.female |    .106722   .0080851    13.20   0.000     .0908755    .1225686
             |
   se#female |
        1 1  |  -.0430045   .0108489    -3.96   0.000    -.0642682   -.0217409
             |
       alder |   .0297881   .0021247    14.02   0.000     .0256238    .0339524
      alder2 |  -.0002828   .0000242   -11.69   0.000    -.0003303   -.0002354
     utd_vgs |   .0970254   .0084518    11.48   0.000       .08046    .1135907
      utd_ba |   .1334368   .0063892    20.88   0.000     .1209141    .1459595
       utd_m |   .0311958   .0076833     4.06   0.000     .0161367    .0462549
        s_hs |    .049172   .0092533     5.31   0.000     .0310357    .0673084
       s_bah |  -.0165108   .0172846    -0.96   0.339    -.0503882    .0173667
       _cons |   4.106968   .0814432    50.43   0.000     3.947341    4.266595
------------------------------------------------------------------------------

. 
. 
. * IF condition, excl. all with charity = 0 
. local sec s_hs s_bah 

. local x ln_wiesp se alder alder2 utd_vgs utd_b utd_m 

. reg ln_gt_sum `x' `sec' if snghnr == 1 & female == 1, r 

Linear regression                               Number of obs     =     90,514
                                                F(9, 90504)       =     347.69
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0354
                                                Root MSE          =     1.0185

------------------------------------------------------------------------------
             |               Robust
   ln_gt_sum |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
    ln_wiesp |   .2253401   .0102898    21.90   0.000     .2051722    .2455081
          se |   .1101999   .0074462    14.80   0.000     .0956054    .1247944
       alder |   .0395865   .0027922    14.18   0.000     .0341139    .0450592
      alder2 |  -.0003568   .0000316   -11.30   0.000    -.0004187    -.000295
     utd_vgs |   .0647075   .0118701     5.45   0.000     .0414423    .0879728
      utd_ba |   .1607307   .0083458    19.26   0.000      .144373    .1770884
       utd_m |   .0017078   .0100515     0.17   0.865    -.0179931    .0214087
        s_hs |   .0607697   .0102026     5.96   0.000     .0407727    .0807666
       s_bah |   .0370562   .0396786     0.93   0.350    -.0407135    .1148258
       _cons |   3.600945   .1233224    29.20   0.000     3.359234    3.842655
------------------------------------------------------------------------------

. 
. local sec s_hs s_bah 

. local x ln_wiesp se alder alder2 utd_vgs utd_b utd_m 

. reg ln_gt_sum `x' `sec' if snghnr == 1 & female == 0, r 

Linear regression                               Number of obs     =     69,887
                                                F(9, 69877)       =     201.41
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0259
                                                Root MSE          =     1.0659

------------------------------------------------------------------------------
             |               Robust
   ln_gt_sum |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
    ln_wiesp |   .1774917   .0084104    21.10   0.000     .1610073    .1939761
          se |   .1393638    .008592    16.22   0.000     .1225235    .1562041
       alder |   .0196506   .0032857     5.98   0.000     .0132106    .0260906
      alder2 |    -.00022   .0000378    -5.82   0.000    -.0002941   -.0001459
     utd_vgs |   .1307439     .01201    10.89   0.000     .1072042    .1542835
      utd_ba |   .1001369   .0100011    10.01   0.000     .0805348    .1197389
       utd_m |   .0780922   .0119657     6.53   0.000     .0546394     .101545
        s_hs |  -.0118025   .0216788    -0.54   0.586     -.054293     .030688
       s_bah |  -.0340536   .0191051    -1.78   0.075    -.0714995    .0033923
       _cons |   4.670674   .1095728    42.63   0.000     4.455912    4.885436
------------------------------------------------------------------------------

. 
. * IF condition, incl all people, charity = 0 --> = 1  
. local sec s_hs s_bah 

. local x ln_wiesp se alder alder2 utd_vgs utd_b utd_m 

. reg ln_gt_sum_1 `x' `sec' if snghnr == 1 & female == 1, r 

Linear regression                               Number of obs     =  1,084,983
                                                F(9, 1084973)     =    3045.40
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0254
                                                Root MSE          =     2.1204

------------------------------------------------------------------------------
             |               Robust
 ln_gt_sum_1 |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
    ln_wiesp |   .1928325   .0025744    74.90   0.000     .1877868    .1978782
          se |   .2608988   .0045346    57.53   0.000     .2520111    .2697865
       alder |     .01614    .001563    10.33   0.000     .0130765    .0192035
      alder2 |  -.0000804   .0000183    -4.41   0.000    -.0001162   -.0000447
     utd_vgs |   .2212607    .004502    49.15   0.000      .212437    .2300844
      utd_ba |   .3725845   .0053666    69.43   0.000     .3620662    .3831028
       utd_m |   .0575562   .0067992     8.47   0.000     .0442299    .0708824
        s_hs |  -.0388214   .0058639    -6.62   0.000    -.0503145   -.0273284
       s_bah |  -.0110007   .0208939    -0.53   0.599     -.051952    .0299506
       _cons |  -2.737779   .0432477   -63.30   0.000    -2.822543   -2.653015
------------------------------------------------------------------------------

. 
. local sec s_hs s_bah 

. local x ln_wiesp se alder alder2 utd_vgs utd_b utd_m 

. reg ln_gt_sum_1 `x' `sec' if snghnr == 1 & female == 0, r 

Linear regression                               Number of obs     =  1,659,948
                                                F(9, 1659938)     =    2692.82
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0167
                                                Root MSE          =     1.5288

------------------------------------------------------------------------------
             |               Robust
 ln_gt_sum_1 |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
    ln_wiesp |   .0971968   .0012207    79.63   0.000     .0948044    .0995893
          se |   .1640976   .0026297    62.40   0.000     .1589434    .1692518
       alder |  -.0198502   .0009711   -20.44   0.000    -.0217535   -.0179469
      alder2 |   .0002824   .0000116    24.43   0.000     .0002597     .000305
     utd_vgs |    .121608   .0025607    47.49   0.000     .1165892    .1266268
      utd_ba |   .2299485   .0036393    63.18   0.000     .2228155    .2370815
       utd_m |   .0264943   .0036728     7.21   0.000     .0192958    .0336929
        s_hs |   .0219595    .006739     3.26   0.001     .0087513    .0351677
       s_bah |  -.0639286   .0031791   -20.11   0.000    -.0701596   -.0576977
       _cons |  -.8110864    .024308   -33.37   0.000    -.8587293   -.7634435
------------------------------------------------------------------------------

. 
. 
. 
. * Not log 
. reg gt_sum wiesp i.se##i.female utd_vgs utd_b utd_m alder alder2 if snghnr == 1, r 

Linear regression                               Number of obs     =  1,146,627
                                                F(9, 1146617)     =    2181.55
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0240
                                                Root MSE          =     2396.7

------------------------------------------------------------------------------
             |               Robust
      gt_sum |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
       wiesp |    .000379   .0000833     4.55   0.000     .0002158    .0005423
        1.se |    92.0189    5.40371    17.03   0.000     81.42781      102.61
    1.female |   210.2444   6.550992    32.09   0.000     197.4047    223.0841
             |
   se#female |
        1 1  |   95.93601   9.710885     9.88   0.000       76.903     114.969
             |
     utd_vgs |   197.2161   7.959861    24.78   0.000      181.615    212.8171
      utd_ba |   439.1143   7.503592    58.52   0.000     424.4076    453.8211
       utd_m |   139.5576   8.859064    15.75   0.000     122.1941     156.921
       alder |  -7.006101   2.225778    -3.15   0.002    -11.36855   -2.643651
      alder2 |   .2285602   .0252456     9.05   0.000     .1790798    .2780407
       _cons |  -219.8333   36.07697    -6.09   0.000     -290.543   -149.1237
------------------------------------------------------------------------------


. 
. reg gt_sum_ wiesp i.se##i.female utd_vgs utd_b utd_m alder alder2 if snghnr == 1, r 

Linear regression                               Number of obs     =  2,754,116
                                                F(9, 2754106)     =    2224.35
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0111
                                                Root MSE          =     1575.9

------------------------------------------------------------------------------
             |               Robust
     gt_sum_ |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
       wiesp |   .0001677    .000024     6.99   0.000     .0001207    .0002148
        1.se |    95.5003   2.347439    40.68   0.000      90.8994    100.1012
    1.female |   93.32084   2.426331    38.46   0.000     88.56532    98.07636
             |
   se#female |
        1 1  |   68.67074    4.52992    15.16   0.000     59.79225    77.54922
             |
     utd_vgs |   82.39702   2.625282    31.39   0.000     77.25156    87.54248
      utd_ba |   179.8263    2.92006    61.58   0.000     174.1031    185.5495
       utd_m |   49.27368    3.56062    13.84   0.000     42.29499    56.25237
       alder |   1.028437   .8554372     1.20   0.229    -.6481899    2.705064
      alder2 |   .0428175   .0099028     4.32   0.000     .0234085    .0622266
       _cons |  -184.0911   15.26967   -12.06   0.000    -214.0191   -154.1631
------------------------------------------------------------------------------

. 
end of do-file

. 
. 
. /******************************************************************************
>                                 Regressions houshold 
> *******************************************************************************/

. 
. 
. * IF condition HH with male se /*excl. all with charity = 0 */
. local demo alder alder2 utd_vgs utd_b utd_m child

. local sec s_hs s_bah 

. reg ln_C_c ln_wiesp_c se_hh_m `demo' `sec' if snghnr == 0 & se_hh_b == 0, r 

Linear regression                               Number of obs     =  3,090,571
                                                F(10, 3090560)    =   17742.47
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0529
                                                Root MSE          =      1.232

------------------------------------------------------------------------------
             |               Robust
      ln_C_c |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
  ln_wiesp_c |   .3442367    .001386   248.36   0.000     .3415202    .3469533
     se_hh_m |  -.0309392   .0018688   -16.56   0.000    -.0346019   -.0272765
       alder |  -.0339003   .0007028   -48.24   0.000    -.0352778   -.0325228
      alder2 |   .0004549   7.99e-06    56.94   0.000     .0004392    .0004705
     utd_vgs |   .1106859   .0024325    45.50   0.000     .1059182    .1154536
      utd_ba |   .2347575   .0017033   137.83   0.000     .2314191    .2380959
       utd_m |   .0585079   .0020027    29.21   0.000     .0545826    .0624332
       child |   .0256466   .0002087   122.87   0.000     .0252375    .0260557
        s_hs |      .0462   .0021521    21.47   0.000      .041982    .0504179
       s_bah |  -.0481085   .0036005   -13.36   0.000    -.0551653   -.0410516
       _cons |   3.302638   .0234885   140.61   0.000     3.256601    3.348675
------------------------------------------------------------------------------

. 
. 
. * IF condition HH with female se /*excl. all with charity = 0 */
. local demo alder alder2 utd_vgs utd_b utd_m child 

. local sec s_hs s_bah 

. reg ln_C_c ln_wiesp_c se_hh_f `demo' `sec' if snghnr == 0 & se_hh_b == 0, r 

Linear regression                               Number of obs     =  3,090,571
                                                F(10, 3090560)    =   17744.02
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0528
                                                Root MSE          =      1.232

------------------------------------------------------------------------------
             |               Robust
      ln_C_c |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
  ln_wiesp_c |   .3424983    .001389   246.59   0.000      .339776    .3452206
     se_hh_f |  -.0177179   .0017591   -10.07   0.000    -.0211656   -.0142701
       alder |   -.033444   .0007025   -47.61   0.000    -.0348209   -.0320672
      alder2 |   .0004496   7.98e-06    56.32   0.000      .000434    .0004653
     utd_vgs |   .1096589   .0024324    45.08   0.000     .1048915    .1144263
      utd_ba |   .2382332   .0017039   139.82   0.000     .2348936    .2415728
       utd_m |    .056389   .0020024    28.16   0.000     .0524644    .0603136
       child |   .0255236   .0002086   122.37   0.000     .0251148    .0259324
        s_hs |   .0479428   .0021676    22.12   0.000     .0436944    .0521912
       s_bah |  -.0459451   .0036038   -12.75   0.000    -.0530084   -.0388818
       _cons |     3.3171    .023554   140.83   0.000     3.270935    3.363265
------------------------------------------------------------------------------

. 


. 
. * IF condition HH with male se /*incl. all with charity = 0 --> 1 */
. local demo alder alder2 utd_vgs utd_b utd_m child

. local sec s_hs s_bah 

. reg ln_C_c_1 ln_wiesp_c se_hh_m `demo' `sec' if snghnr == 0 & se_hh_b == 0, r 

Linear regression                               Number of obs     =  9,547,956
                                                F(10, 9547945)    >   99999.00
                                                Prob > F          =     0.0000
                                                R-squared         =     0.1247
                                                Root MSE          =     3.6859

------------------------------------------------------------------------------
             |               Robust
    ln_C_c_1 |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
  ln_wiesp_c |   1.420708   .0031977   444.29   0.000     1.414441    1.426975
     se_hh_m |  -.2804444   .0029725   -94.35   0.000    -.2862704   -.2746184
       alder |  -.1540429   .0010961  -140.54   0.000    -.1561912   -.1518946
      alder2 |   .0021325   .0000127   168.21   0.000     .0021077    .0021574
     utd_vgs |   .5047889   .0029908   168.78   0.000      .498927    .5106507
      utd_ba |   1.132877   .0030583   370.43   0.000     1.126883    1.138871
       utd_m |   .3587062   .0040086    89.48   0.000     .3508494     .366563
       child |   .0115039   .0003387    33.97   0.000     .0108402    .0121677
        s_hs |   .0556555   .0039929    13.94   0.000     .0478295    .0634815
       s_bah |  -.3832075   .0048931   -78.32   0.000    -.3927977   -.3736172
       _cons |  -16.81442   .0467767  -359.46   0.000     -16.9061   -16.72274
------------------------------------------------------------------------------

. 
. 
. * IF condition HH with female se /*incl. all with charity = 0 --> 1 */
. local demo alder alder2 utd_vgs utd_b utd_m child

. local sec s_hs s_bah 

. reg ln_C_c_1 ln_wiesp_c se_hh_f `demo' `sec' if snghnr == 0 & se_hh_b == 0, r 

Linear regression                               Number of obs     =  9,547,956
                                                F(10, 9547945)    >   99999.00
                                                Prob > F          =     0.0000
                                                R-squared         =     0.1239
                                                Root MSE          =     3.6875

------------------------------------------------------------------------------
             |               Robust
    ln_C_c_1 |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
  ln_wiesp_c |   1.420107   .0032125   442.06   0.000     1.413811    1.426404
     se_hh_f |  -.0207869   .0030184    -6.89   0.000    -.0267029    -.014871
       alder |   -.153057   .0010966  -139.57   0.000    -.1552063   -.1509077
      alder2 |   .0021197   .0000127   167.11   0.000     .0020948    .0021446
     utd_vgs |    .492924   .0029869   165.03   0.000     .4870698    .4987783
      utd_ba |   1.153991   .0030655   376.44   0.000     1.147982    1.159999
       utd_m |   .3474788   .0040103    86.65   0.000     .3396187     .355339
       child |   .0111788   .0003391    32.97   0.000     .0105142    .0118434
        s_hs |    .113307   .0040037    28.30   0.000     .1054599     .121154
       s_bah |  -.3262516   .0048891   -66.73   0.000    -.3358341   -.3166691
       _cons |  -16.88136   .0470222  -359.01   0.000    -16.97352    -16.7892
------------------------------------------------------------------------------

. 
end of do-file

. 
. 
. *Interaction term formulation /*excl. all with charity = 0 */
. reg ln_C_c ln_wiesp_c i.se##i.female `demo' `sec' if snghnr == 0, r 

Linear regression                               Number of obs     =  3,102,130
                                                F(12, 3102117)    =   14955.33
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0532
                                                Root MSE          =     1.2312

------------------------------------------------------------------------------
             |               Robust
      ln_C_c |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
  ln_wiesp_c |   .3440839   .0013921   247.17   0.000     .3413555    .3468124
        1.se |  -.0372588    .002184   -17.06   0.000    -.0415394   -.0329782
    1.female |   .0049486   .0019349     2.56   0.011     .0011562    .0087411
             |
   se#female |
        1 1  |   .0055195    .002942     1.88   0.061    -.0002467    .0112856
             |
       alder |  -.0336377   .0007018   -47.93   0.000    -.0350132   -.0322622
      alder2 |   .0004528   7.98e-06    56.76   0.000     .0004372    .0004685
     utd_vgs |   .1103988    .002428    45.47   0.000       .10564    .1151575
      utd_ba |    .235438   .0017051   138.08   0.000     .2320961    .2387799
       utd_m |   .0576353   .0019992    28.83   0.000     .0537169    .0615537
       child |   .0257437   .0002083   123.58   0.000     .0253354     .026152
        s_hs |     .03563   .0022926    15.54   0.000     .0311366    .0401233
       s_bah |  -.0544311   .0037028   -14.70   0.000    -.0616885   -.0471738
       _cons |   3.303316   .0236274   139.81   0.000     3.257007    3.349624
------------------------------------------------------------------------------

. 
. *Interaction term formulation /*incl. all with charity = 0 --> 1 */
. local demo alder alder2 utd_vgs utd_b utd_m child

. local sec s_hs s_bah

. reg ln_C_c_1 ln_wiesp_c i.se##i.female `demo' `sec' if snghnr == 0, r 

Linear regression                               Number of obs     =  9,712,392
                                                F(12, 9712379)    =   85930.28
                                                Prob > F          =     0.0000
                                                R-squared         =     0.1282
                                                Root MSE          =     3.6645

------------------------------------------------------------------------------
             |               Robust
    ln_C_c_1 |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
  ln_wiesp_c |   1.453443   .0031137   466.79   0.000      1.44734    1.459546
        1.se |  -.2146174   .0035661   -60.18   0.000    -.2216067    -.207628
    1.female |   .2545097   .0034663    73.42   0.000     .2477158    .2613036
             |
   se#female |
        1 1  |  -.0581856   .0049245   -11.82   0.000    -.0678374   -.0485337
             |
       alder |  -.1510456   .0010803  -139.82   0.000    -.1531629   -.1489284
      alder2 |   .0020803   .0000125   166.62   0.000     .0020558    .0021048
     utd_vgs |   .4977622   .0029475   168.88   0.000     .4919853    .5035392
      utd_ba |   1.105863   .0030197   366.21   0.000     1.099945    1.111782
       utd_m |   .3538996   .0039478    89.65   0.000     .3461621    .3616371
       child |   .0110576   .0003358    32.93   0.000     .0103994    .0117158
        s_hs |  -.0672442    .004291   -15.67   0.000    -.0756544    -.058834
       s_bah |  -.3308028   .0051671   -64.02   0.000    -.3409302   -.3206754
       _cons |  -17.39424   .0459906  -378.21   0.000    -17.48438    -17.3041
------------------------------------------------------------------------------

. 
end of do-file

. 
end of do-file
