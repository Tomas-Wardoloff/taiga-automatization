# Taiga Analytics 
On this repository, you'll find a complete setup to extract, transform, and visualize key metrics from your Taiga project using n8n for automation and Metabase for visualization.

## Metrics Overview
### Sprint Velocity
Sprint Velocity measures the amount of work a team can complete during a sprint. It is calculated by summing the story points of all completed user stories within that sprint. This metric helps teams understand their capacity and plan future sprints more effectively.

Answers the question: *How fast are we going?*

#### Database Schema
Table: `sprint_velocity`
```sql
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
```

## Contributing and contact
If you have any questions do not hesitate on reach out to me via [email](mailto:tomaswardoloff@gmail.com) or via [linkedin](https://www.linkedin.com/in/tomaswardoloff/)