class <%= controller_class_name %>Controller < ApplicationController
<% unless suffix -%>
  def index
    list
    render_action 'list'
  end
<% end -%>

<% for action in unscaffolded_actions -%>
  def <%= action %><%= suffix %>
  end

<% end -%>
  def list<%= suffix %>
    @<%= plural_name %> = <%= model_name %>.find_all
  end

  def show<%= suffix %>
    @<%= singular_name %> = <%= model_name %>.find(@params[:id])
  end

  def new<%= suffix %>
    @<%= singular_name %> = <%= model_name %>.new
  end

  def create<%= suffix %>
    @<%= singular_name %> = <%= model_name %>.new(@params[:<%= singular_name %>])
    if @<%= singular_name %>.save
      flash['notice'] = '<%= model_name %> was successfully created.'
      redirect_to :action => 'list<%= suffix %>'
    else
      render_action 'new<%= suffix %>'
    end
  end

  def edit<%= suffix %>
    @<%= singular_name %> = <%= model_name %>.find(@params[:id])
  end

  def update
    @<%= singular_name %> = <%= model_name %>.find(@params[:id])
    if @<%= singular_name %>.update_attributes(@params[:<%= singular_name %>])
      flash['notice'] = '<%= model_name %> was successfully updated.'
      redirect_to :action => 'show<%= suffix %>', :id => @<%= singular_name %>
    else
      render_action 'edit<%= suffix %>'
    end
  end

  def destroy<%= suffix %>
    <%= model_name %>.find(@params[:id]).destroy
    redirect_to :action => 'list<%= suffix %>'
  end
end
