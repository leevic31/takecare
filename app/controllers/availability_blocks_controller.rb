class AvailabilityBlocksController < ApplicationController
    def create
        @availability_block = AvailabilityBlock.new(availability_block_params)

        if @availability_block.save
            render json: @availability_block, status: :created
        else
            render json: @availability_block.errors, status: :unprocessable_entity
        end
    end

    private

    def availability_block_params
        params.require(:availability_block).permit(:start_time, :end_time, :user_id)
    end
end
