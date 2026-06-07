package org.project.jobwebsite.service;

import org.project.jobwebsite.model.JobPost;
import org.project.jobwebsite.repo.JobRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobService
{
    @Autowired
    JobRepo repo;
    public void addjob(JobPost job)
    {
        repo.save(job);
    }
    public List<JobPost> getalljobs()
    {
        return repo.findAll();
    }
    public void deletejob(int id)
    {
        repo.deleteById(id);
    }
    public List<JobPost> filtersearch(String keyword)
    {
        if (keyword != null && !keyword.isEmpty()) {
            return repo.findByPostProfileContainingIgnoreCase(keyword);
        }
        else return repo.findAll();
    }
}
