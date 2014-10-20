class BatchBlocksController < ApplicationController

  load_and_authorize_resource

  before_filter :set_current_user

  def destroy
    if BatchBlock.clear_blocks_from_current_user
      respond_to do |format|
        format.js
      end
    end
  end

end
