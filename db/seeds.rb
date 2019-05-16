# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all

Product.create!(title: 'Seven Mobile Apps in Seven Weeks',
                description:
                    %{<p>
                      <em>Native Apps, Multiple Platforms</em>
                      Answer the question “Can we build this for ALL the devices?” with a
                      resounding YES. This book will help you get there with a real-world
                      introduction to seven platforms, whether you’re new to mobile or an
                      experienced developer needing to expand your options. Plus, you’ll find
                      out which cross-platform solution makes the most sense for your needs.
                      </p>},
                image_url: 'mutest.jpg',
                price: 26.00)
Product.create!(title: 'Sync with the remote.',
                description:
                    %{<p>
                      <em>At my old company, we also had a “no merge commits” policy,
                      so rebasing was the norm. Here’s a command that fetches from all the remotes,
                      syncs the remote change from origin, and applies your commits on top of them.
                      </p>},
                image_url: 'ahihi.jpeg',
                price: 50.00)
Product.create!(title: 'Start a new branch.',
                description:
                    %{<p>
                      <em>Additionally, you can have repo-specific aliases.
                        Just edit .git/config in the repo where you want to add the alias,
                        and follow the same syntax. This can be useful if you want to override the “g p”
                        alias to push to a different remote (for my Heroku apps, for example,
                        I have my “g p” command push to the Heroku production remote).
                      </p>},
                image_url: 'ahuhu.png',
                price: 100.00)
