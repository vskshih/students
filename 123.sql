BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "studentsapp_student" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"cName"	varchar(20) NOT NULL,
	"cSex"	varchar(2) NOT NULL,
	"cBirthday"	date NOT NULL,
	"cEmail"	varchar(100) NOT NULL,
	"cPhone"	varchar(50) NOT NULL,
	"cAddr"	varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "studentsapp_student" VALUES (1,'李采茜','F','1987-04-04','elven@superstar.com','0922988876','台北市濟洲北路12號');
INSERT INTO "studentsapp_student" VALUES (2,'許佩琪','F','1987-07-01','jinglun@superstar.com','0918181111','台北市敦化南路93號5樓');
INSERT INTO "studentsapp_student" VALUES (3,'陳建佑','M','1987-08-11','sugie@superstar.com','0914530768','台北市中央路201號7樓');
INSERT INTO "studentsapp_student" VALUES (4,'趙宏志','M','1984-06-20','shane@superstar.com','0946820035','台北市建國路177號6樓');
INSERT INTO "studentsapp_student" VALUES (5,'羅俊翔','M','1988-02-15','ivy@superstar.com','0920981230','台北市忠孝東路520號6樓');
INSERT INTO "studentsapp_student" VALUES (6,'李佳妮','F','1987-05-05','zhong@superstar.com','0951983366','台北市三民路1巷10號');
INSERT INTO "studentsapp_student" VALUES (7,'林聖文','M','1985-08-30','lala@superstar.com','0918123456','台北市仁愛路100號');
INSERT INTO "studentsapp_student" VALUES (8,'邱心怡','F','1986-12-10','crystal@superstar.com','0907408965','台北市民族路204號');
INSERT INTO "django_session" VALUES ('wpaxc9s3y2ekimxcu0g5ud44ooro7mmi','YjhkMTYyODJkOWRhZTViNjc1OGE2MTk2MDIwNmViY2NjNGFkNjIyZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNDFkZTc4ZTc0MzhkMTlhMTU4ZjMwOWVhOTQ3YzA0NzllMzg5MDRjIn0=','2019-07-03 09:02:16.166974');
INSERT INTO "django_session" VALUES ('6h86fi80v2fzab8ur7ou211w86h6iypi','YjhkMTYyODJkOWRhZTViNjc1OGE2MTk2MDIwNmViY2NjNGFkNjIyZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNDFkZTc4ZTc0MzhkMTlhMTU4ZjMwOWVhOTQ3YzA0NzllMzg5MDRjIn0=','2019-07-03 09:21:14.918959');
INSERT INTO "django_session" VALUES ('nhgwdz6pbnypjcbokuoqbhteq12pzng5','ODMwY2EzYzcyZjY5MDZiOThkY2YxNzIzNGE4NjcyMzUxOGM3MzBhNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZTBmM2YzY2VkZDBhNWMyY2Q2NDRjODdiOTYxMTlhMGQxM2YxMGNjIn0=','2020-04-28 07:29:16.981188');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$150000$eJKDOKdLsSGr$rx3waXsE0Tp17f4SWqFrY0jgmbiyK8I6mr6OYMI4cM0=','2019-06-19 09:21:14.769047',1,'admin','','tsjeng45@yahoo.com.tw',1,1,'2019-06-19 09:01:26.737001','');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$180000$KlUnXKFlA3Xh$Ze+V/YQA6GlKa37G7BCaeRHl1N8uCiyfgtyNt6y19zc=','2020-04-14 07:29:16.968222',1,'07176075','','vsk19941017@gmail.com.tw',1,1,'2020-04-14 07:22:43.134884','');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_student','Can add student');
INSERT INTO "auth_permission" VALUES (26,7,'change_student','Can change student');
INSERT INTO "auth_permission" VALUES (27,7,'delete_student','Can delete student');
INSERT INTO "auth_permission" VALUES (28,7,'view_student','Can view student');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'studentsapp','student');
INSERT INTO "django_admin_log" VALUES (1,'2019-06-19 09:03:21.427428','1','李采茜','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2019-06-19 09:22:22.175110','2','許佩琪','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2019-06-19 09:23:15.208670','3','陳建佑','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2019-06-19 09:24:03.501234','4','趙宏志','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (5,'2019-06-19 09:24:45.800907','5','羅俊翔','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2019-06-19 09:25:25.968231','6','李佳妮','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2019-06-19 09:26:12.551459','7','林聖文','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2019-06-19 09:26:57.511623','8','邱心怡','[{"added": {}}]',7,1,1);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2019-06-19 08:40:39.138363');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2019-06-19 08:40:39.247738');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2019-06-19 08:40:39.362487');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2019-06-19 08:40:39.473142');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2019-06-19 08:40:39.560273');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2019-06-19 08:40:39.681615');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2019-06-19 08:40:39.782714');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2019-06-19 08:40:39.938700');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2019-06-19 08:40:40.046683');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2019-06-19 08:40:40.186914');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2019-06-19 08:40:40.291179');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2019-06-19 08:40:40.395008');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2019-06-19 08:40:40.514854');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2019-06-19 08:40:40.626669');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2019-06-19 08:40:40.740741');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2019-06-19 08:40:40.850581');
INSERT INTO "django_migrations" VALUES (17,'sessions','0001_initial','2019-06-19 08:40:40.938659');
INSERT INTO "django_migrations" VALUES (18,'studentsapp','0001_initial','2019-06-19 08:57:06.143093');
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
