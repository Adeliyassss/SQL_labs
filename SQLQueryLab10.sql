﻿
/*Написать триггеры (before, after, instead of DML) для любой таблицы в базе данных и проверить эффекты работы*/
CREATE TRIGGER trg_kontakty_insert
ON kontakty
INSTEAD OF INSERT
AS
BEGIN
  IF EXISTS (SELECT * FROM inserted WHERE kontakty = '')
  BEGIN
    RAISERROR ('Insertion of a kontakts with an empty value is not allowed.', 1, 1)
    ROLLBACK TRANSACTION
  END
END;
GO

CREATE TRIGGER Kontaky_UPDATE
ON kontakty
AFTER UPDATE
AS
INSERT INTO tip_kontaktov(id_tip_kontaktov, tip_kontaktov)
SELECT id_kontakty, 'Êëèåíò ' + id_klient + ' òèï êîíòàêòà ' + id_tip_kontaktov + ' êîíòàêò ' + kontakty
FROM INSERTED

INSERT INTO kontakty VALUES(1, 1, '0705264895')
UPDATE kontakty SET id_klient='Kani'
WHERE id_klient=1

SELECT * FROM tip_kontaktov