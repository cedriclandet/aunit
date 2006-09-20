------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                     A U N I T . T E S T _ R U N N E R                    --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                                                                          --
--                       Copyright (C) 2000-2006, AdaCore                   --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 2,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License  distributed with GNAT;  see file COPYING.  If not, write --
-- to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, --
-- Boston, MA 02110-1301, USA.                                              --
--                                                                          --
-- GNAT is maintained by AdaCore (http://www.adacore.com)                   --
--                                                                          --
------------------------------------------------------------------------------

with AUnit_Framework.Test_Results.Text_Reporter;
with AUnit_Framework.Time_Measure;

--  Framework using text reporter
package body AUnit_Framework.Framework is

   package Reporter is new Test_Results.Text_Reporter;

   Results : aliased Test_Results.Result;
   --  Test results for one harness run

   procedure Test_Runner (Timed : Boolean := True) is
      Time : Time_Measure.Time;
   begin
      Test_Results.Clear (Results);
      if Timed then
         Time_Measure.Start_Measure (Time);
      end if;
      Test_Suites.Run (Suite, Results'Access);
      if Timed then
         Time_Measure.Stop_Measure (Time);
         Test_Results.Set_Elapsed (Results, Time);
      end if;
      Reporter.Report (Results);
   end Test_Runner;

end AUnit_Framework.Framework;
