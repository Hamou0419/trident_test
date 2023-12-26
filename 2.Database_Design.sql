DROP TABLE IF EXISTS `teachers`;

CREATE TABLE teachers (
    -- 流水號
    id bigint PRIMARY KEY,
    -- 教師編號 亂數產生六碼
    uid bigint NOT NULL,
    -- 教師姓名
    name varchar(200) NOT NULL,
    -- 登入帳號
    username varchar(36) NOT NULL,
    -- 登入密碼 使用部屬環境的privateKey進行加密儲存
    password varchar(70) NOT NULL,
    -- 創建時間
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    -- 更新時間
    update_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    -- 刪除時間 (軟刪除)
    deleted_at timestamp NULL DEFAULT NULL,
    UNIQUE (uid) -- 建立 uid 的唯一索引
);

DROP TABLE IF EXISTS `students`;

CREATE TABLE students (
    -- 流水號
    id bigint PRIMARY KEY,
    -- 學生編號 亂數產生六碼
    uid bigint NOT NULL,
    -- 學生姓名
    name varchar(200) NOT NULL,
    -- 登入帳號
    username varchar(36) NOT NULL,
    -- 登入密碼 使用部屬環境的privateKey進行加密儲存
    password varchar(70) NOT NULL,
    -- 創建時間
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    -- 更新時間
    update_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    -- 刪除時間 (軟刪除)
    deleted_at timestamp NULL DEFAULT NULL,
    UNIQUE (uid) -- 建立 uid 的唯一索引
);

DROP TABLE IF EXISTS `courses`;

CREATE TABLE courses (
    -- 流水號
    id BIGINT PRIMARY KEY,
    -- 教師編號
    teacher_id BIGINT,
    -- 創建時間
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    -- 更新時間
    update_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    -- 刪除時間 (軟刪除)
    deleted_at timestamp NULL DEFAULT NULL,
    INDEX id_unique (id),
    INDEX idx_teacher_id (teacher_id),
    FOREIGN KEY(teacher_id) REFERENCES teachers(uid)
);

DROP TABLE IF EXISTS `courses_history`;

CREATE TABLE courses_history (
    -- 流水號
    id BIGINT PRIMARY KEY,
    -- 教師編號
    teacher_id BIGINT,
    -- 學生編號
    student_id BIGINT,
    -- 課程編號
    course_id BIGINT,
    -- 創建時間
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    -- 更新時間
    update_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    -- 刪除時間 (軟刪除)
    deleted_at timestamp NULL DEFAULT NULL,
    INDEX id_unique (id),
    FOREIGN KEY(teacher_id) REFERENCES teachers(uid),
    FOREIGN KEY(student_id) REFERENCES students(uid),
    FOREIGN KEY(course_id) REFERENCES courses(id)
);