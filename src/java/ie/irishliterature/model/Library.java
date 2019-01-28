package ie.irishliterature.model;

import java.util.ArrayList;

/**
 *
 * @author markus
 */
public class Library {

    private int bookID;

    private String referenceNumber;

    private ArrayList<String> Author;

    private String Title;

    private String Publisher;

    private String Publisheryear;

    private String Genre;
    
    private String Series;

    private String translationTitle;

    private String translationPublisher;

    private String translationPublisherYear;

    private ArrayList<String> Translator;

    private ArrayList<String>  Language;

    private String physicalDescription;

    private String cover;//path + filename

    private String coverName; //filename

    private int Duplicates;

    private String Copies;

    private String Notes;

    private String ISBN;

    private String ISSN;
    

    private java.sql.Timestamp LASTUPDATED;

    /**
     * @return the bookID
     */
    public int getBookID() {
        return bookID;
    }

    /**
     * @param bookID the bookID to set
     */
    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    /**
     * @return the referenceNumber
     */
    public String getReferenceNumber() {
        return referenceNumber;
    }

    /**
     * @param referenceNumber the referenceNumber to set
     */
    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    /**
     * @return the Author
     */
    public ArrayList<String> getAuthor() {
        return Author;
    }

    /**
     * @param Author the Author to set
     */
    public void setAuthor(ArrayList<String> Author) {
        this.Author = Author;
    }

    /**
     * @return the Title
     */
    public String getTitle() {
        return Title;
    }

    /**
     * @param Title the Title to set
     */
    public void setTitle(String Title) {
        this.Title = Title;
    }

    /**
     * @return the Publisher
     */
    public String getPublisher() {
        return Publisher;
    }

    /**
     * @param Publisher the Publisher to set
     */
    public void setPublisher(String Publisher) {
        this.Publisher = Publisher;
    }

    /**
     * @return the Publisheryear
     */
    public String getPublisheryear() {
        return Publisheryear;
    }

    /**
     * @param Publisheryear the Publisheryear to set
     */
    public void setPublisheryear(String Publisheryear) {
        this.Publisheryear = Publisheryear;
    }

    /**
     * @return the Genre
     */
    public String getGenre() {
        return Genre;
    }

    /**
     * @param Genre the Genre to set
     */
    public void setGenre(String Genre) {
        this.Genre = Genre;
    }

    /**
     * @return the translationTitle
     */
    public String getTranslationTitle() {
        return translationTitle;
    }

    /**
     * @param translationTitle the translationTitle to set
     */
    public void setTranslationTitle(String translationTitle) {
        this.translationTitle = translationTitle;
    }

    /**
     * @return the translationPublisher
     */
    public String getTranslationPublisher() {
        return translationPublisher;
    }

    /**
     * @param translationPublisher the translationPublisher to set
     */
    public void setTranslationPublisher(String translationPublisher) {
        this.translationPublisher = translationPublisher;
    }

    /**
     * @return the translationPublisherYear
     */
    public String getTranslationPublisherYear() {
        return translationPublisherYear;
    }

    /**
     * @param translationPublisherYear the translationPublisherYear to set
     */
    public void setTranslationPublisherYear(String translationPublisherYear) {
        this.translationPublisherYear = translationPublisherYear;
    }

    /**
     * @return the Translator
     */
    public ArrayList<String>getTranslator() {
        return Translator;
    }

    /**
     * @param Translator the Translator to set
     */
    public void setTranslator(ArrayList<String> Translator) {
        this.Translator = Translator;
    }

    /**
     * @return the Language
     */
    public ArrayList<String>  getLanguage() {
        return Language;
    }

    /**
     * @param Language the Language to set
     */
    public void setLanguage(ArrayList<String>  Language) {
        this.Language = Language;
    }

    /**
     * @return the physicalDescription
     */
    public String getPhysicalDescription() {
        return physicalDescription;
    }

    /**
     * @param physicalDescription the physicalDescription to set
     */
    public void setPhysicalDescription(String physicalDescription) {
        this.physicalDescription = physicalDescription;
    }

    /**
     * @return the Duplicates
     */
    public int getDuplicates() {
        return Duplicates;
    }

    /**
     * @param Duplicates the Duplicates to set
     */
    public void setDuplicates(int Duplicates) {
        this.Duplicates = Duplicates;
    }

    /**
     * @return the Copies
     */
    public String getCopies() {
        return Copies;
    }

    /**
     * @param Copies the Copies to set
     */
    public void setCopies(String Copies) {
        this.Copies = Copies;
    }

    /**
     * @return the Notes
     */
    public String getNotes() {
        return Notes;
    }

    /**
     * @param Notes the Notes to set
     */
    public void setNotes(String Notes) {
        this.Notes = Notes;
    }

    /**
     * @return the ISBN
     */
    public String getISBN() {
        return ISBN;
    }

    /**
     * @param ISBN the ISBN to set
     */
    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    /**
     * @return the ISSN
     */
    public String getISSN() {
        return ISSN;
    }

    /**
     * @param ISSN the ISSN to set
     */
    public void setISSN(String ISSN) {
        this.ISSN = ISSN;
    }

    /**
     * @return the LASTUPDATED
     */
    public java.sql.Timestamp getLASTUPDATED() {
        return LASTUPDATED;
    }

    /**
     * @param LASTUPDATED the LASTUPDATED to set
     */
    public void setLASTUPDATED(java.sql.Timestamp LASTUPDATED) {
        this.LASTUPDATED = LASTUPDATED;
    }

    /**
     * @return the coverName
     */
    public String getCoverName() {
        return coverName;
    }

    /**
     * @param coverName the coverName to set
     */
    public void setCoverName(String coverName) {
        this.coverName = coverName;
    }

    /**
     * @return the cover
     */
    public String getCover() {
        return cover;
    }

    /**
     * @param cover the cover to set
     */
    public void setCover(String cover) {
        this.cover = cover;
    }

    /**
     * @return the Series
     */
    public String getSeries() {
        return Series;
    }

    /**
     * @param Series the Series to set
     */
    public void setSeries(String Series) {
        this.Series = Series;
    }

}
