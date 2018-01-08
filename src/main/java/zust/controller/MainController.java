package zust.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import sun.util.calendar.BaseCalendar;
import zust.dao.RelationMapper;
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
    AdminService adminService;

    @Autowired
    RelationService relationService;

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
        return "talk";
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
        userinfo.setUserinfoVip((byte) 0);
        userinfo.setUserinfoId(user.getUserId());
        userinfoService.InsertUserinfo(userinfo);
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
            if (user.getUserAccount().equals(username) && user.getUserPassword().equals(password)){
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
        if (followsSC.get(0).getScId() == null){
            followsSC = null;
        }
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
        User user1 = userService.selectByUserName(user.getUserAccount());
        Integer follows = userService.selectFollows(user.getUserId());
        Integer fans = userService.selectFans(user.getUserId());
        System.out.println(user1.getScList().size()+" "+user1.getScList().get(0).getScId());
        if(user1.getScList().get(0).getScId() == null){
            user1.setScList(null);
        }
        mav.addObject("user",user1);
        mav.addObject("fans",fans);
        mav.addObject("follows",follows);
        return mav;
    }

    @RequestMapping(value = "/updateuser.do",method = RequestMethod.POST)
    public String updateuserController(HttpServletRequest request,String realname,
                                       String introduce,@DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday) throws IOException {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("headshot");
        if (!file.isEmpty()){
            String path = "D:\\Better\\IDEA\\ssm\\src\\main\\webapp\\resources\\img";
            String fileName = file.getOriginalFilename();
            File dir = new File(path, fileName);
            if(!dir.exists()){
                dir.mkdirs();
            }
            file.transferTo(dir);
            User user = (User) session.getAttribute("user");
            Userinfo userinfo = new Userinfo();
            userinfo.setUserinfoBirth(birthday);
            userinfo.setUserinfoStatement(introduce);
            userinfo.setUserinfoId(user.getUserId());
            userinfo.setUserinfoPicurl("resources/img/"+fileName);
            userinfo.setUserinfoVip((byte) 0);
            userinfoService.updateUserinfo(userinfo);
            user.setUserRealname(realname);
            userService.updateByPrimaryKeySelective(user);
        }else{
            User user = (User) session.getAttribute("user");
            Userinfo userinfo = new Userinfo();
            userinfo.setUserinfoBirth(birthday);
            userinfo.setUserinfoStatement(introduce);
            userinfo.setUserinfoId(user.getUserId());
            userinfo.setUserinfoVip((byte) 0);
            userinfoService.updateUserinfo(userinfo);
            user.setUserRealname(realname);
            userService.updateByPrimaryKeySelective(user);
        }
        return "redirect:personpage.do";
    }

    @RequestMapping(value = "/fansfollow.do",method = RequestMethod.GET)
    public ModelAndView fansfollowController(){
        ModelAndView mav = new ModelAndView("fanandfollows");
        User user = (User) session.getAttribute("user");
        Integer follows = userService.selectFollows(user.getUserId());
        Integer fans = userService.selectFans(user.getUserId());
        List<User> fansList = userService.findfansListByUserId(user.getUserId());
        List<User> followsList = userService.findfollowsListByUserId(user.getUserId());
        mav.addObject("fansList",fansList);
        mav.addObject("followsList",followsList);
        mav.addObject("user",user);
        mav.addObject("fans",fans);
        mav.addObject("follows",follows);
        return mav;
    }

    @RequestMapping(value = "/notfollow.do",method = RequestMethod.GET)
    public String notfollowController(String userId,String followerId){
        int userid = Integer.parseInt(userId);
        int followsid = Integer.parseInt(followerId);
        relationService.deleteByUserIdAndFollowerId(userid, followsid);
        return "redirect:fansfollow.do";
    }

    @RequestMapping(value = "/deletesc.do",method = RequestMethod.GET)
    public String deletescController(String scId){
        if (schickenService.selectByPK(Integer.parseInt(scId)).getPicture() != null){
            pictureService.deleteByScPk(Integer.parseInt(scId));
        }
        if (schickenService.selectByPK(Integer.parseInt(scId)).getScComments() != 0){
            commentsService.deleteByScId(Integer.parseInt(scId));
        }
        schickenService.deletscByPk(Integer.parseInt(scId));
        return "redirect:personpage.do";
    }

    @RequestMapping(value = "/searchUser.do",method = RequestMethod.GET)
    public ModelAndView searchUserController(String what2search){
        ModelAndView mav = new ModelAndView("searchUser");
        User user = (User) session.getAttribute("user");
        List<User> userList = userService.selectByAnyName(what2search,user.getUserId());
        mav.addObject("userList",userList);
        mav.addObject("user",user);
        return mav;
    }

    @RequestMapping(value = "/addrelation.do",method = RequestMethod.GET)
    public String addrelationController(String userId,String searchUserId){
        Relation relation = new Relation();
        relation.setRelatedUserId(Integer.parseInt(userId));
        relation.setRelationUserId(Integer.parseInt(searchUserId));
        relationService.insertRelation(relation);
        return "redirect:searchUser.do";
    }

    @RequestMapping(value = "/adminlogin.do",method = RequestMethod.POST)
    public ModelAndView adminloginController(String account,String psw){
        ModelAndView mav = new ModelAndView("admin");
        ModelAndView error = new ModelAndView("hello");
        if (account.equals("admin") && psw.equals("admin")){
            List<User> allUser = userService.AllUser();
            Admin admin = adminService.selectByName(account);
            mav.addObject("admin",admin);
            mav.addObject("alluser",allUser);
            session.setAttribute("admin",admin);
            return mav;
        }else{
            mav.addObject("loginflag",0);
            return error;
        }
    }

    @RequestMapping(value = "/admin.do",method = RequestMethod.GET)
    public ModelAndView adminController(){
        ModelAndView mav = new ModelAndView("admin");
        Admin admin = (Admin) session.getAttribute("admin");
        mav.addObject("admin",admin);
        List<User> allUser = userService.AllUser();
        mav.addObject("alluser",allUser);
        return mav;
    }

    @RequestMapping(value = "/deleteUser.do",method = RequestMethod.GET)
    public String deleteUserController(String userId){
        int userid = Integer.parseInt(userId);
        userService.deleteUserById(userid);
        return "redirect:admin.do";
    }

    @RequestMapping(value = "/adminlogout.do",method = RequestMethod.GET)
    public String adminlogoutController(){
        session.removeAttribute("admin");
        return "redirect:index.do";
    }

    @RequestMapping(value = "/becomevip.do",method = RequestMethod.GET)
    public String becomeVIPController(String userId){
        int userid = Integer.parseInt(userId);
        Userinfo userinfo = new Userinfo();
        userinfo.setUserinfoVip((byte) 1);
        userinfo.setUserinfoId(userid);
        userinfoService.updateUserinfo(userinfo);
        return "redirect:mainpage.do";
    }
}
