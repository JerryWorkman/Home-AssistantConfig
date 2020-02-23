# psql -h 192.168.10.2 -U hass hass
hass=> select * from states where entity_id = 'sensor.meter_kwh_for_last_24_hr' and state like '9%';
hass=> delete from states where entity_id = 'sensor.meter_kwh_for_last_24_hr' and state like '9%';
