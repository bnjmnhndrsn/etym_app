class EtymologiesController < ApplicationController
  def index
    @etymologies = Etymology.all
  end
  
  def show
    @etymology = Etymology.find_by(headword: params[:id])
  end
end