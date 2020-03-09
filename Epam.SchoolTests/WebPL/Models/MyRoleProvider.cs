using Ioc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace WebPL.Models
{
    public class MyRoleProvider : RoleProvider
    {
        public override bool IsUserInRole(string username, string roleName)
        {
            if (roleName == "Users")
            {
                return true;
            }

            if (roleName == "Admins")
            {
                return username.StartsWith("admin");
            }

            return false;
        }

        public override string[] GetRolesForUser(string username)
        {
            
            if (DependencyResolver.AccountLogic.GetRole(username).Equals("Admin"))
            {
                return new string[] { "Admin", "User" };
            }
            else if (DependencyResolver.AccountLogic.GetRole(username).Equals("User"))
            {
                return  new string[] { "User" };
            }
            else
            {
                return new string[] { "Guest" };
            }
        }

        #region Not implemented
        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}