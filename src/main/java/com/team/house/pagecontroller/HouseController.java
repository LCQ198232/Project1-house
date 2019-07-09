package com.team.house.pagecontroller;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.*;
import com.team.house.service.DistrictService;
import com.team.house.service.HouseService;
import com.team.house.service.StreetService;
import com.team.house.service.TypeService;
import com.team.house.util.HouseCondition;
import com.team.house.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller()
@RequestMapping("/page/")
public class HouseController {


    @Autowired
    private DistrictService districtService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private StreetService streetService;
    @Autowired
    private HouseService houseService;

    //加载房屋类型和区域 下拉列表
    @RequestMapping("goFabu")
    public String goFabu(Model model){
        //房屋类型
        List<Type> types = typeService.getAllType();
        //区域
        List<District> districts = districtService.getDistrictList();

        model.addAttribute("types",types);
        model.addAttribute("districts",districts);
        return "page/fabu";
    }


    //加载区域类型下的街道
    @RequestMapping("getAllStreet")
    @ResponseBody
    public List<Street> getAllStreet(Integer id){
        List<Street> streets = streetService.getStreetByDid(id);
         return streets;
    }


    //添加房屋(发布房屋)
    @RequestMapping("insertHouse")
    public String insertHouse(House house, @RequestParam(name = "pfile",required = false)
            CommonsMultipartFile pfile, HttpSession session)throws Exception{

        //实现文件上传,图片存储在图片服务器中   d:/inmages
        String uploadfileName=pfile.getOriginalFilename();//要上传的文件名  1.jpg
        //获取文件名的后缀  .png  .gif
        String expname = uploadfileName.substring(uploadfileName.lastIndexOf("."));
        //保存文件名
        String pname=System.currentTimeMillis()+expname;
        String path="d:/images/"+pname;//路径格式: d:/images/1342324325.png

        File uploadfile=new File(path);//path为图片服务器地址  上传路径
         pfile.transferTo(uploadfile);//文件上传

        //将图片路径保存到数据库  文件名:1342324325.png   System.currentTimeMillis()为当前毫秒数
        house.setPath(pname);
          //设置编号id
        house.setId(System.currentTimeMillis()+"");
        //设置用户编号 为登录用户的id   (Users)session.getAttribute("logininfo")).getId() 取出登录用户的id
        house.setUserId(((Users)session.getAttribute("logininfo")).getId());


        //调用业务
        int i = houseService.insertHouse(house);

        if (i>0){
            return "redirect:getHouse";
        }else {
            //发布失败 把上传的文件删除
            uploadfile.delete();
            return "page/fabu";
        }
    }

    //查询房屋
    @RequestMapping("getHouse")
    public String getHouse(HttpSession session, Page page,
                           @RequestParam(value = "isdel", defaultValue = "0")Integer isdel, Model model){
      //获取用户编号
       Users user=(Users)session.getAttribute("logininfo");

       //获取该用户发布的房屋信息
        PageInfo<House> houses = houseService.getHouseByuId(user.getId(), page,isdel);
        model.addAttribute("houses",houses);
        if (isdel==0){
            return "page/guanli";
        }else {
            return "page/delguanli";
        }

    }


    //查询房屋通过主键
    @RequestMapping("getHouseByid")
    public String getHouseByid(String id,Model model){
        House house = houseService.getHouse(id);
        model.addAttribute("house",house);
        return "page/upfabu";
    }

    //修改房屋信息
    @RequestMapping("updateHouse")
    public String updateHouse(House house,String oldpath,@RequestParam(name = "pfile",required = false)
                                      CommonsMultipartFile pfile)throws Exception{
      //实现文件上传,图片存储在图片服务器中   d:/inmages
        String uploadfileName=pfile.getOriginalFilename();//要上传的文件名  1.jpg
        if (uploadfileName.equals("")){
            //没有选择图片，不用上传新图片，数据不用更新
        }else {
              //获取文件名的后缀  .png  .gif
            String expname = uploadfileName.substring(uploadfileName.lastIndexOf("."));
            //保存文件名
            String pname=System.currentTimeMillis()+expname;
            String path="d:/images/"+pname;//路径格式: d:/images/1342324325.png

            File uploadfile=new File(path);//path为图片服务器地址  上传路径
            pfile.transferTo(uploadfile);//文件上传
            //删除原有图片
            new File("d:/images/"+oldpath).delete();

            //设置新图片
            house.setPath(pname);
        }
              houseService.updateHouse(house);
          return "redirect:getHouse";
    }


    //逻辑删除房屋 异步删除和还原信息
    @RequestMapping("delHouse")
    public String delHouse(String id,Integer isdel){
         houseService.delHouse(id, isdel);

        return "redirect:getHouse";
    }

//浏览房屋信息
    @RequestMapping("getBroswerHouse")
    public String getBroswerHouse(HouseCondition condition, Model model){
        PageInfo<House> pageInfo = houseService.getBroswerHouse(condition);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("condition",condition);
        return "page/list";
    }

     //浏览单个房屋详细信息
    @RequestMapping("showHouse")
    public String showHouse(String id,Model model){
        House house = houseService.getHouse(id);
        model.addAttribute("house",house);
        return "page/details";
    }
}
