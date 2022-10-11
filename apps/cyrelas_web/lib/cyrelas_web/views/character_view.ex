defmodule CyrelasWeb.CharacterView do
  use CyrelasWeb, :view
  alias CyrelasWeb.CharacterView

  def render("index.json", %{characters: characters}) do
    %{data: render_many(characters, CharacterView, "character.json")}
  end

  def render("show.json", %{character: character}) do
    %{data: render_one(character, CharacterView, "character.json")}
  end

  def render("character.json", %{character: character}) do
    %{
      id: character.id,
      name: character.name,
      archetype: character.archetype
    }
  end
end
