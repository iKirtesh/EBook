package entity;

public class Address {

        private int addressId;
        private String address;
        private String city;
        private String state;
        private String country;
        private String zipCode;
        private boolean saveInfo;

        public Address() {
        }

        public Address(int addressId, String address, String city, String state, String country, String zipCode) {
            this.addressId = addressId;
            this.address = address;
            this.city = city;
            this.state = state;
            this.country = country;
            this.zipCode = zipCode;
        }


    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public boolean isSaveInfo() {
        return saveInfo;
    }

    public void setSaveInfo(boolean saveInfo) {
        this.saveInfo = saveInfo;
    }
}
