package com.ptit.devops.lab;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class LabController {

    private final LabRepository labRepository;

    @Value("${app.version:local}")
    private String appVersion;

    public LabController(LabRepository labRepository) {
        this.labRepository = labRepository;
    }

    @GetMapping("/")
    public Map<String, Object> home() {
        Map<String, Object> m = new HashMap<>();
        m.put("message", "DevOps Final Practice");
        m.put("version", appVersion);
        m.put("labs", labRepository.findAll());
        return m;
    }

    @GetMapping("/api/labs")
    public List<Lab> labs() {
        return labRepository.findAll();
    }
}
