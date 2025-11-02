CREATE TABLE IF NOT EXISTS projects (
    id SERIAL PRIMARY KEY,
    project_id BIGINT UNIQUE NOT NULL,
    project_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS sprint_velocity (
    id SERIAL PRIMARY KEY,
    sprint_id BIGINT NOT NULL,
    sprint_name VARCHAR(255),
    project_id BIGINT,
    points_completed NUMERIC(5, 2), 
    sprint_start_date DATE,
    sprint_end_date DATE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(sprint_id, project_id),
    CONSTRAINT project_fk FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE IF NOT EXISTS daily_burndown (
    id SERIAL PRIMARY KEY,
    snapshot_date DATE NOT NULL,
    sprint_id BIGINT NOT NULL,
    project_id BIGINT,
    points_remaining NUMERIC(5, 2),
    points_ideal NUMERIC(5, 2), 
    UNIQUE(snapshot_date, sprint_id),
    CONSTRAINT project_fk FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE IF NOT EXISTS work_item_cycle_time (
    id SERIAL PRIMARY KEY,
    item_taiga_id BIGINT NOT NULL, 
    item_type VARCHAR(50), -- 'UserStory', 'Task', 'Issue'
    project_id BIGINT,
    started_at TIMESTAMP,
    finished_at TIMESTAMP,
    cycle_time_days NUMERIC(7, 2),
    UNIQUE(item_taiga_id, item_type),
    CONSTRAINT project_fk FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE IF NOT EXISTS daily_issue_snapshot (
    id SERIAL PRIMARY KEY,
    snapshot_date DATE NOT NULL,
    project_id BIGINT,
    status_name VARCHAR(100),
    issue_count INT,
    UNIQUE(snapshot_date, project_id, status_name),
    CONSTRAINT project_fk FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE IF NOT EXISTS daily_workload_snapshot (
    id SERIAL PRIMARY KEY,
    snapshot_date DATE NOT NULL,
    project_id BIGINT,
    user_name VARCHAR(255),
    active_task_count INT,
    UNIQUE(snapshot_date, project_id, user_name),
    CONSTRAINT project_fk FOREIGN KEY (project_id) REFERENCES projects(id)
);