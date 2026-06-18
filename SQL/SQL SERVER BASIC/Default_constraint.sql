

CREATE TABLE UserProfiles (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    SubscriptionTier VARCHAR(20) DEFAULT 'Free',
    SignupDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

/*
DEFAULT 'Free': If we skip the SubscriptionTier when adding a user, the database inserts 'Free'.

DEFAULT CURRENT_TIMESTAMP: If we skip the SignupDate, the database calls a system function to insert the exact date and time the row was generated.
*/

-- User 1: We explicitly provide all information (overriding the defaults)
INSERT INTO UserProfiles (UserID, Username, SubscriptionTier, SignupDate)
VALUES (1, 'Alice_Admin', 'Pro', '2023-01-15 09:30:00');

-- User 2: We only provide the ID and Username (relying on the defaults)
INSERT INTO UserProfiles (UserID, Username)
VALUES (2, 'Bob_Builder');

INSERT INTO UserProfiles (UserID, Username, SubscriptionTier)
VALUES (3, 'Charlie_Chaplin', 'Basic');

INSERT INTO UserProfiles (UserID, Username, SubscriptionTier, SignupDate)
VALUES (4, 'Diana_Prince', DEFAULT, DEFAULT);

INSERT INTO UserProfiles (UserID, Username)
VALUES 
    (5, 'Eve_Hacker'),
    (6, 'Frank_Ocean');

select * from UserProfiles