docker exec -i postgres sh -c "rm /vol_db/temp.dm"
docker exec -i postgres psql -U postgres -c "\copy (select * from project1_weather) to '/vol_db/temp.dm' csv header;"
[ ! -d "~/4dump" ] || mkdir ~/4dump
[ -f "~/4dump/temp.dm" ] && rm ~/4dump/temp.dm
docker cp postgres:vol_db/temp.dm ~/4dump/temp.dm


 
