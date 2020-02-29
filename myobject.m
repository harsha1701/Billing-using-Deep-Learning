classdef myobject
   properties
       panel
       item
       number
       cost
       buttond
       buttoni
       price
       editfunc
   end
   methods
       
        function obj=createme(obj,p,name,l,fun)
           obj.panel=uipanel(p);  
           obj.panel.BorderType='none';
           j=p.Position(3);
           obj.panel.Position=[0 0 j 50];
           obj.item=uilabel(obj.panel);
           obj.number=uilabel(obj.panel);
           obj.cost=uilabel(obj.panel);
           obj.buttond=uibutton(obj.panel);
           obj.buttoni=uibutton(obj.panel);
           obj.price=(l(2));
           obj.editfunc=fun;
           obj.setitem(name)
           obj.setnumber(l(1))
           obj.setcost()
           obj.setbuttond()
           obj.setbuttoni()
           obj.organize()
        end
        
        function setpos(obj,j)
           obj.panel.Position(2)=1+50*j;
        end
        
        function setitem(obj,name)
          obj.item.Text=name;
          obj.item.HorizontalAlignment='right';
        end
        
        function setnumber(obj,e)
          obj.number.Text=num2str(e);
          obj.number.HorizontalAlignment='right';
        end
        function setcost(obj)
          obj.cost.Text=num2str(str2double(obj.number.Text)*obj.price);
          obj.cost.HorizontalAlignment='right';
        end
        
         function setbuttoni(obj)
          obj.buttoni.Text='Increase';
          obj.buttoni.VerticalAlignment='center';
          function buttonipress(~,~,obj)
            obj.number.Text=int2str(str2double(obj.number.Text)+1);
            obj.setcost();
            obj.editfunc();
          end
          obj.buttoni.ButtonPushedFcn=@(btn,event) buttonipress(btn,event,obj);
          end
        
        function setbuttond(obj)
          obj.buttond.Text='Decrease';
          obj.buttond.VerticalAlignment='center';
          function buttondpress(~,~,obj)
            if str2double(obj.number.Text)>0
               obj.number.Text=int2str(str2double(obj.number.Text)-1);
               obj.setcost();
               obj.editfunc();
            end
          end
          obj.buttond.ButtonPushedFcn=@(btn,event) buttondpress(btn,event,obj);
        end
        
        function organize(obj)
          obj.item.Position=[0 0 150 50];
          obj.number.Position=[150 0 50 50];
          obj.cost.Position=[200 0 100 50];
          obj.buttond.Position=[340 18 60 20];
          obj.buttoni.Position=[440 18 60 20];          
        end
        
   end
end