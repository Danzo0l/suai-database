ALTER TABLE Tours
DROP CONSTRAINT IF EXISTS fk_TravelAgency,
ADD CONSTRAINT fk_TravelAgencies FOREIGN KEY (TravelAgencyid)
REFERENCES TravelAgencies (ID) ON DELETE CASCADE;