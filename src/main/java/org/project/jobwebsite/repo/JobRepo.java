package org.project.jobwebsite.repo;

import org.project.jobwebsite.model.JobPost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface JobRepo extends JpaRepository<JobPost,Integer>
{
    List<JobPost> findByPostProfileContainingIgnoreCase(String keyword);

}
