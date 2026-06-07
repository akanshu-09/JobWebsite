package org.project.jobwebsite.repo;

import org.project.jobwebsite.model.JobPost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface JobRepo extends JpaRepository<JobPost,Integer>
{

}
