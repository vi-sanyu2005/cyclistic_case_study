── Data Summary ────────────────────────
                           Values        
Name                       all_data_clean
Number of rows             3959527       
Number of columns          17            
_______________________                  
Column type frequency:                   
  character                9             
  numeric                  6             
  POSIXct                  2             
________________________                 
Group variables            None          

── Variable type: character ──────────────────────────────────────────────────────────────────────────────
  skim_variable      n_missing complete_rate min max empty n_unique whitespace
1 ride_id                    0             1  16  16     0  3959527          0
2 rideable_type              0             1  12  16     0        3          0
3 start_station_name         0             1  10  64     0     1864          0
4 start_station_id           0             1   3  35     0     1780          0
5 end_station_name           0             1  10  64     0     1864          0
6 end_station_id             0             1   3  35     0     1779          0
7 member_casual              0             1   6   6     0        2          0
8 day_of_week                0             1   6   9     0        7          0
9 month                      0             1   3   9     0       12          0

── Variable type: numeric ────────────────────────────────────────────────────────────────────────────────
  skim_variable n_missing complete_rate  mean      sd        p0    p25    p50   p75   p100 hist 
1 start_lat             0             1  41.9  0.0431  41.6      41.9   41.9   41.9   42.1 ▁▁▇▆▁
2 start_lng             0             1 -87.6  0.0261 -87.9     -87.7  -87.6  -87.6  -87.5 ▁▁▂▇▁
3 end_lat               0             1  41.9  0.0433  41.6      41.9   41.9   41.9   42.1 ▁▁▇▇▁
4 end_lng               0             1 -87.6  0.0262 -87.8     -87.7  -87.6  -87.6  -87.5 ▁▁▃▇▁
5 ride_length           0             1  16.2 32.9      0.00117   5.76   9.97  17.8 1439.  ▇▁▁▁▁
6 start_hour            0             1  14.0  4.81     0        10     15     17     23   ▁▃▅▇▃

── Variable type: POSIXct ────────────────────────────────────────────────────────────────────────────────
  skim_variable n_missing complete_rate min                 max                 median             
1 started_at            0             1 2024-05-31 11:49:34 2025-05-31 23:57:03 2024-09-21 23:14:01
2 ended_at              0             1 2024-06-01 00:00:02 2025-05-31 23:59:48 2024-09-21 23:31:30
  n_unique
1  3958924
2  3958228
