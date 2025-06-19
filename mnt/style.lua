-- landuse_style.lua

-- Declare tables
local tables = {}
tables.landuse = osm2pgsql.define_way_table('landuse', {
  { column = 'osm_id',           type = 'bigint',   not_null = true },
  { column = 'landuse',          type = 'text' },
  { column = 'name',             type = 'text' },  -- optional
  { column = 'geom',             type = 'multipolygon',   projection = 4326 },
})

-- Filter way objects (closed ways)
function osm2pgsql.process_way(object)

  if not object.tags.landuse then
    return
  end

  local name = object.tags.name or nil

  tables.landuse:insert({
    osm_id   = object.id,
    landuse  = object.tags.landuse,
    name     = name,
    geom     = object:as_multipolygon()
  })

end

-- Filter relation objects
function osm2pgsql.process_relation(object)

  if not object.tags.landuse or othen
    return
  end

  local name = object.tags.name or nil
  
  tables.landuse:insert({
    osm_id   = object.id,
    landuse  = object.tags.landuse,
    name     = name,
    geom     = object:as_multipolygon()
  })

end
