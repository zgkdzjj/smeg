# Override default application date format e.g. Date.today.to_s => "20/08/2013"

DF_TIME24='%H:%M'
DF_DATE_AND_TIME24='%d/%m/%Y - %H:%M'

Date::DATE_FORMATS[:default] = '%d/%m/%Y'
Date::DATE_FORMATS[:simple] = '%d %b %Y'
Date::DATE_FORMATS[:month] = '%B'
Date::DATE_FORMATS[:month_and_year] = '%B %Y'
Date::DATE_FORMATS[:date_and_time] = '%d/%m/%Y - %r'
Date::DATE_FORMATS[:simple_dt] = '%d %b %Y, %r'
Date::DATE_FORMATS[:time24] = DF_TIME24
Date::DATE_FORMATS[:date_and_time24] = DF_DATE_AND_TIME24

Time::DATE_FORMATS[:default] = '%d/%m/%Y'
Time::DATE_FORMATS[:simple] = '%d %b %Y'
Time::DATE_FORMATS[:month] = '%B'
Time::DATE_FORMATS[:month_and_year] = '%B %Y'
Time::DATE_FORMATS[:date_and_time] = '%d/%m/%Y - %r'
Time::DATE_FORMATS[:simple_dt] = '%d %b %Y, %r'
Time::DATE_FORMATS[:time24] = DF_TIME24
Time::DATE_FORMATS[:date_and_time24] = DF_DATE_AND_TIME24
Time::DATE_FORMATS[:ubicar] = '%e %b %Y, %I:%M%p'


#Mos File Date format
Date::DATE_FORMATS[:mos_date] = '%d/%m/%Y'
Time::DATE_FORMATS[:mos_date] = '%d/%m/%Y'
