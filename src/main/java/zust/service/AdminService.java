package zust.service;

import org.springframework.stereotype.Service;
import zust.model.Admin;

@Service
public interface AdminService {
    Admin selectByName(String name);
}
