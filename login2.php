<?php
include("dbcon.php");
session_start();
if(isset($_POST['submit']))
{
    $email=$_POST['email'];
    $mobile=$_POST['mobile'];
    $password=$_POST['password'];
    $sql="select * from registration where email='$email' or mobile='$mobile'";
    $x=mysqli_query($con,$sql);
    if($r=mysqli_fetch_assoc($x))
    {
     $dbpswd=$r['password'];
     $name=$r['name'];
     $id=$r['id'];
     
     if(password_verify($password,$dbpswd))
     {
         if(isset($_POST['remember']))
         {
            setcookie('email',$email,time()+60*60*24);
            setcookie('mobile',$mobile,time()+60*60*24);
            setcookie('password',$password,time()+60*60*24);
            $_SESSION['name']=$name;
            $_SESSION['id']=$id;
            header("location:profile.php");
         }
         else
         {
            $_SESSION['name']=$name;
            $_SESSION['id']=$id;
            header("location:profile.php");
         }
          }
     else
     {
        $_SESSION['error']="Something Went Wrong Password Invalid"; 
        header("location:login.php"); 
     }
}
    else
    {
        $_SESSION['error']="Something Went Wrong either Email Or Mobile is Invalid"; 
        header("location:login.php"); 
    }
    }
?>



