INSERT INTO asset_types (name) VALUES
('Laptop'),
('Server'),
('Router');

INSERT INTO locations (name) VALUES
('Server Room'),
('Lab A'),
('Office');

INSERT INTO assets (asset_tag, name, asset_type_id, locations_id, status)
VALUES
('AST-001', 'Dell Latitude 5420', 1, 3, 'AVAILABLE'),
('AST-002', 'HP ProLiant DL380', 2, 1, 'IN_USE');
