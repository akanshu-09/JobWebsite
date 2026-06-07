package org.project.jobwebsite.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Entity
@NoArgsConstructor
@Data
@AllArgsConstructor
public class JobPost
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int PostId;
    private String PostProfile;
    private String PostDesc;
    private int ReqExperience;
    @ElementCollection
    private List<String> PostTechStack;
}
