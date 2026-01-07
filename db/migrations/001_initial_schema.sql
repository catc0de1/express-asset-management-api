-- initial schemas

CREATE TABLE IF NOT EXISTS asset_types (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT
);

CREATE TABLE IF NOT EXISTS locations (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT
);

CREATE TABLE IF NOT EXISTS assets (
  id SERIAL PRIMARY KEY,
  asset_tag TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  asset_type_id INTEGER NOT NULL REFERENCES asset_types(id),
  locations_id INTEGER REFERENCES locations(id),
  status TEXT NOT NULL DEFAULT 'AVAILABLE',
  serial_number TEXT UNIQUE,
  metadata JSONB,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS assignments (
  id SERIAL PRIMARY KEY,
  asset_id INTEGER NOT NULL REFERENCES assets(id) ON DELETE CASCADE,
  assigned_to TEXT NOT NULL,
  start_date TIMESTAMP NOT NULL DEFAULT NOW(),
  end_date TIMESTAMP,
  notes TEXT
);

CREATE INDEX IF NOT EXISTS  idx_assets_status ON assets(status);
CREATE INDEX IF NOT EXISTS idx_assets_type ON assets(asset_type_id);
CREATE INDEX IF NOT EXISTS idx_assets_location ON assets(locations_id);
CREATE INDEX IF NOT EXISTS idx_assignments_asset ON assignments(asset_id);

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_assets_updated
BEFORE UPDATE ON assets
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();
