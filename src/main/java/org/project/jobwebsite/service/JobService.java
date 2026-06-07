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
}
