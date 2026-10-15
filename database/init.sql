CREATE TABLE IF NOT EXISTS labs (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  location VARCHAR(100) NOT NULL
);

INSERT INTO labs (name, location) VALUES
('Lab Cloud', 'A101'),
('Lab Network', 'A102'),
('Lab Security', 'B201'),
('Lab DevOps', 'B202'),
('Lab AI', 'C301'),
('Lab Mobile', 'C302'),
('Lab Web', 'D401'),
('Lab Data', 'D402');
