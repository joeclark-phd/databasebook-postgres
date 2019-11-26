
DROP TABLE IF EXISTS listings;
CREATE TABLE listings (
  id serial PRIMARY KEY,
  title text,
  description text,
  start_price numeric,
  create_date timestamp,
  auction_end_date timestamp,
  seller_name text
);

INSERT INTO listings (title, description, start_price, create_date, auction_end_date, seller_name)
VALUES
('Antique #4 handplane','This is an antique smoothing plane in good condition with just a little rust.', 20.0, '2019-10-31 08:00:00', '2019-11-7 08:00:00', 'joe clark'),
('Refurbished panel saw','This saw is toothed for rip cuts and has been refurbished and sharpened by owner.', 30.0, '2019-10-30 09:15', '2019-11-3 09:15', 'joe clark'),
('Used database book','Need a textbook for Dr Clark''s database class? This one is gently used and autographed by the author.', 25.0, now(), now() + interval '1 week', 'ben studying');

