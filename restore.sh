  docker cp ~/4dump/temp.dm postgres:vol_db/
  #docker exec -i postgres psql -U postgres -c "insert into project1_city (name) values ('Moscow');"
  docker exec -i postgres psql -U postgres -c "delete from project1_weather;"
  docker exec -i postgres psql -U postgres -c "copy project1_weather from '/vol_db/temp.dm' csv header;"
  docker exec -i postgres psql -U postgres -c "SELECT setval('project1_weather_id_seq', (SELECT MAX(id) FROM project1_weather));"
