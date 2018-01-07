package zust.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import sun.util.calendar.BaseCalendar;
import zust.model.*;
import zust.service.*;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    CommentsService commentsService;

    @Autowired
    PictureService pictureService;

    @Autowired
    SchickenService schickenService;

    @Autowired
    UserinfoService userinfoService;

    @Autowired
    UserService userService;

    @Autowired
    HttpSession session;

    @RequestMapping(value = "/index.do",method = RequestMethod.GET)
    public String welcomeController(){
        return "hello";
    }

    @RequestMapping(value = "/register.do",method = RequestMethod.GET)
    public ModelAndView registerController(String rusername){
        ModelAndView mav = new ModelAndView("register","command",new User());
        mav.addObject("username",rusername);
        return mav;
    }

    @RequestMapping(value = "/register.do",method = RequestMethod.POST)
    public ModelAndView signupController(User user,String gender){
        ModelAndView mav = new ModelAndView("signup");
        user.setUserGender(gender);
        Userinfo userinfo = new Userinfo();
        userinfo.setUserinfoPicurl("D:\\Better\\IDEA\\ssm\\src\\main\\webapp\\resources\\img\\dog.png");
        user.setUserinfo(userinfo);
        userService.insertUser(user);
        user = userService.selectByUserName(user.getUserAccount());
        mav.addObject("user",user);
        session.setAttribute("user",user);
        session.setAttribute("loginflag",1);
        return mav;
    }

    @RequestMapping(value = "/visit.do",method = RequestMethod.GET)
    public ModelAndView visitController(){
        ModelAndView mav = new ModelAndView("visitpage");
        PageInfo<SChicken> sclist = schickenService.selectByTime(0,5);
        mav.addObject("sclist",sclist);
        return mav;
    }

    @RequestMapping(value = "/search.do", method = RequestMethod.GET)
    public ModelAndView searchController(String what2search){
        ModelAndView mav = new ModelAndView("search");
        PageInfo<SChicken> sclist = schickenService.selectByInfo(what2search,0,5);
        mav.addObject("sclist",sclist);
        return mav;
    }

    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public ModelAndView loginController(String username,String password){
        ModelAndView mav = new ModelAndView("personpage");
        ModelAndView error = new ModelAndView("hello");
        User user = userService.selectByUserName(username);
        if(user.getScList().get(0).getScId() == null){
            user.setScList(null);
        }
        Integer follows = userService.selectFollows(user.getUserId());
        Integer fans = userService.selectFans(user.getUserId());
        if (user == null){
            mav.addObject("loginright",0);
            return error;
        }else{
            if (user.getUserName().equals(username) && user.getUserPassword().equals(password)){
                mav.addObject("loginright",1);
                mav.addObject("user",user);
                mav.addObject("fans",fans);
                mav.addObject("follows",follows);
                session.setAttribute("user",user);
                session.setAttribute("loginflag",1);
                return mav;
            }else{
                mav.addObject("loginright",0);
                return error;
            }
        }
    }

    @RequestMapping(value = "/mainpage.do", method = RequestMethod.GET)
    public ModelAndView mainpageController(){
        User user = (User) session.getAttribute("user");
        ModelAndView mav = new ModelAndView("mainpage");
        mav.addObject("user",user);
        Integer follows = userService.selectFollows(user.getUserId());
        Integer fans = userService.selectFans(user.getUserId());
        Integer SCs = userService.selectscs(user.getUserId());
        List<SChicken> followsSC = schickenService.selectFollowsSCByUserId(user.getUserId());
        mav.addObject("followsSC",followsSC);
        mav.addObject("fans",fans);
        mav.addObject("follows",follows);
        mav.addObject("SCs",SCs);
        return mav;
    }

    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public ModelAndView logoutController(){
        ModelAndView mav = new ModelAndView("hello");
        session.removeAttribute("user");
        session.removeAttribute("loginright");
        session.setAttribute("loginflag",0);
        return mav;
    }

    @RequestMapping(value = "/sendsc.do", method = RequestMethod.POST)
    public String sendscController(HttpServletRequest request,String scinfo) throws IOException {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("scimg");
        if (!file.isEmpty()){
            String path = "D:\\Better\\IDEA\\ssm\\src\\main\\webapp\\resources\\img";
            String fileName = file.getOriginalFilename();
            File dir = new File(path, fileName);
            if(!dir.exists()){
                dir.mkdirs();
            }
            file.transferTo(dir);
            User user = (User) session.getAttribute("user");
            SChicken sc = new SChicken();
            Picture picture = new Picture();
            picture.setPictureUserId(user.getUserId());
            picture.setPictureUrl("resources/img/"+fileName);
            pictureService.insertSelectPicture(picture);
            picture = pictureService.selectPictureByName(fileName);
            sc.setScUserId(user.getUserId());
            sc.setScInfo(scinfo);
            sc.setScDate(new Date());
            sc.setScLike(0);
            sc.setScComments(0);
            sc.setScPictureId(picture.getPictureId());
            schickenService.insertSC(sc);
            return "redirect:mainpage.do";
        }else{
            User user = (User) session.getAttribute("user");
            SChicken sc = new SChicken();
            sc.setScUserId(user.getUserId());
            sc.setScInfo(scinfo);
            sc.setScDate(new Date());
            sc.setScLike(0);
            sc.setScComments(0);
            schickenService.insertSC(sc);
            return "redirect:mainpage.do";
        }
    }

    @RequestMapping(value = "/likes.do",method = RequestMethod.GET)
    public String likesController(String scId){
        SChicken sChicken = schickenService.selectByPK(Integer.parseInt(scId));
        sChicken.setScLike(sChicken.getScLike() + 1);
        schickenService.updateSchicken(sChicken);
        return "redirect:mainpage.do";
    }

    @RequestMapping(value = "/sendcomment.do",method = RequestMethod.GET)
    public String sendCommentController(String commentinfo,String commentuserid,String scid){
        Comments comments = new Comments();
        comments.setCommentsInfo(commentinfo);
        comments.setCommentsScId(Integer.parseInt(scid));
        comments.setCommentsUserId(Integer.parseInt(commentuserid));
        comments.setCommentsDate(new Date());
        SChicken sChicken = schickenService.selectByPK(Integer.parseInt(scid));
        sChicken.setScComments(sChicken.getScComments()+1);
        schickenService.updateSchicken(sChicken);
        commentsService.insertComment(comments);
        return "redirect:mainpage.do";
    }

    @RequestMapping(value = "/personpage.do",method = RequestMethod.GET)
    public ModelAndView personpageController(){
        ModelAndView mav = new ModelAndView("personpage");
        User user = (User) session.getAttribute("user");
        Integer follows = userService.selectFollows(user.getUserId());
        Integer fans = userService.selectFans(user.getUserId());
        mav.addObject("user",user);
        mav.addObject("fans",fans);
        mav.addObject("follows",follows);
        return mav;
    }
}
