class Attendee
  def initialize(height, pass_id = nil)
    @height = height
    @pass_id = pass_id
  end

  def height
    @height
  end

  def pass_id
    @pass_id
  end

  def issue_pass!(new_pass_id)
    @pass_id = new_pass_id
    @pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  # Retorna true se o participante tem um passe de carona
  def has_pass?
    !@pass_id.nil?
  end

  # Retorna true se a altura do participante é suficiente para o passeio
  def fits_ride?(min_height)
    @height >= min_height
  end

  # Verifica se o participante tem permissão para fazer um passeio
  def allowed_to_ride?(min_height)
    has_pass? && fits_ride?(min_height)
  end
end

