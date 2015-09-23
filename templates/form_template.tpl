                    <form action="/rentals" method="GET" class="form-style-5" role"form">
                    <div class="col-xs-6">
                      <label for="city">City</label>
                      <select id="city" name="city">
                          <option value="Eugene">Eugene</option>
                          <option value="Springfield">Springfield</option>
                          <option value="Veneta">Veneta</option>
                          <option value="Creswell">Creswell</option>
                          <option value="CottageGrove">Cottage Grove</option>
                       </select>
                    </div>
                    <div class="col-xs-6">
                          <label for="zip">Zip Code</label>
                          <input type="number" name="zip" size="5">
                    </div>
                    <div class="col-xs-6">
                          <label>Price</label>
                          <input type="number" name="min-cost" placeholder="Min">
                          <input type="number" name="max-cost" placeholder="Max">
                    </div>
                    <div class="col-xs-6">
                          <label>Square Footage</label>
                          <input type="number" name="min-size" placeholder="Min">
                          <input type="number" name="max-size" placeholder="Max">
                    </div>
                    <div class="col-xs-6">
                          <label for="bed">Beds</label>
                          <select id="bed" name="bed">
                              <option value="0">0 +</option>
                              <option value="1">1 +</option>
                              <option value="2">2 +</option>
                              <option value="3">3 +</option>
                              <option value="4">4 +</option>
                              <option value="5">5 +</option>
                              <option value="6">6 +</option>
                          </select>
                    </div>
                    <div class="col-xs-6">
                          <label for="bath">Baths:</label>
                          <select id="bath" name="bath">
                              <option value="0">0 +</option>
                              <option value="1">1 +</option>
                              <option value="2">2 +</option>
                              <option value="3">3 +</option>
                              <option value="4">4 +</option>
                              <option value="5">5 +</option>
                              <option value="6">6 +</option>
                          </select>
                    </div>
                    <div class="col-xs-6">
                          <label>Available By:</label>
                          <input type="date" name="available" placeholder="mm/dd/yyyy">
                    </div>
                    <div class="col-xs-6">
                          <label>Lease Type:</label>
                          <select name="lease">
                              <option value="ANY">Any Lease Length</option>
                              <option value="1">Month-to-Month</option>
                              <option value="6">6 Month or Less</option>
                              <option value="12">12 Month or Less</option>
                          </select>
                    </div>
                    <div class="col-xs-12">
                          <label>Type:</label>
                          <input type="checkbox" name="studio" value="Studio" checked="True">Studio
                          <input type="checkbox" name="house" value="House" checked="True">House
                          <input type="checkbox" name="apartment" value="Apartment" checked="True">Apartment
                          <input type="checkbox" name="condo" value="Condo" checked="True">Condo
                    </div>
                    <div class="col-xs-12">
                          <label>Pets:</label>
                          <input type="checkbox" name="cats" value="1">Cats Ok
                          <input type="checkbox" name="dogs" value="1">Dogs Ok
                    </div>
                    <div class="col-xs-12">
                      <button class="btn btn-lg btn-default" action="submit" type="submit">Find It</button>
                    </div>
                  </form>