package org.project.jobwebsite;

import org.project.jobwebsite.model.JobPost;
import org.project.jobwebsite.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class WebController
{
    @Autowired
    JobService service;
    @GetMapping({"/","home"})
    public String home()
    {
        return "home";
    }
    @GetMapping("addjob")
    public String addjob()
    {
        return "addjob";
    }
    @PostMapping("handleForm")
    public String handleform(JobPost jobPost)
    {
        service.addjob(jobPost);
        return "success";
    }
    @GetMapping("viewalljobs")
    public String getjobs(Model m)
    {
        List<JobPost> jobs = service.getalljobs();
        m.addAttribute("jobPosts",jobs);
        return "viewalljobs";
    }
}
